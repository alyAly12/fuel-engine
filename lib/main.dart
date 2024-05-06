import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sayarah/core/utils/app_route.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/firebase_options.dart';
import 'core/commom_bloc/connection_check_bloc/connection_check_bloc.dart';
import 'core/commom_bloc/keyboard_bloc/custom_keyboard_bloc.dart';
import 'core/commom_bloc/theme_cubit/theme_cubit.dart';
import 'core/component/navigator_global.dart';
import 'core/services/service_locator.dart' as di;
import 'core/services/service_locator.dart';
import 'core/utils/app_colors.dart';
import 'features/signup_feature/domain/entities/handheld_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di.init();
  await Hive.initFlutter();
  Hive.registerAdapter(HandHeldModelAdapter());
  await Hive.openBox<HandHeldModel>(AppStrings.kHandHeldBox);
  runApp(EasyLocalization(
    child: MaterialApp(debugShowCheckedModeBanner: false, home: SyarahApp()),
    supportedLocales: [Locale('en', 'US'), Locale('ur', 'UR')],
    path: 'assets/resources',
    saveLocale: true,
  ));
}

class SyarahApp extends StatelessWidget {
  const SyarahApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider.value(
            value: sl<ConnectionCheckBloc>()
              ..add(CheckLocationEvent())
              ..add(NfcCheckEvent())
              ..add(ConnectedEvent())),
        BlocProvider(
          create: (context) => CustomKeyboardBloc(),
        ),
      ],
      child: BlocConsumer<ConnectionCheckBloc, ConnectionCheckState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) async {
          if (state is NotConnectedState) {
            sl<ConnectionCheckBloc>()
                .add(ChangeDialogVisibilityEvent(isVisible: true));
            GlobalInternetNavigator.showAlertDialog(
                text: state.message,
                goIcon: state.icon,
                bkColor: AppColors.bkColorNotConnected,
                iconColor: state.color);
          } else if (state is ConnectedState) {
            if (state.isDialogShown) {
              Navigator.pop(AppRoute.globalContext);
              GlobalNavigator.showNotificationDialog(
                  text: state.message,
                  bkColor: AppColors.bkColorConnected,
                  iconColor: state.color, icon: state.icon);
              sl<ConnectionCheckBloc>()
                  .add(ChangeDialogVisibilityEvent(isVisible: false));
            }
          }
          if (state is LocationNotConnectedState) {
            GlobalNavigator.showNotificationDialog(
                text: state.message,

                bkColor: AppColors.connectionCancelColor,
                iconColor: state.color, icon: state.icon);
          }
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, __) => MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: 'Syarah',
              key: AppRoute.navigatorKey,
              theme: ThemeData.light(useMaterial3: false).copyWith(
                iconTheme:
                    const IconThemeData(color: AppColors.appBarColor, size: 0),
                textTheme:
                    GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
              ),
              routerConfig: AppRoute.router,
            ),
          );
        },
      ),
    );
  }
}
