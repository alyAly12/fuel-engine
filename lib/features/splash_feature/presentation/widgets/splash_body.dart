import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/features/splash_feature/presentation/bloc/splash_bloc/splash_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/utils/app_route.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/app_strings.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  Future<void> checkLogging() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLog = await pref.getBool(AppStrings.isLoggedIn) ?? false;
    if (isLog) {
      GoRouter.of(context).pushReplacement(AppRoute.kRootScreen);
    }
  }

  Future<void> checkRegister() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isRegister = await pref.getBool(AppStrings.isRegister) ?? false;
    if (isRegister) {
      GoRouter.of(context).pushReplacement(AppRoute.kLoginView);
    }
  }

  @override
  void initState() {
    checkRegister();
    checkLogging();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccessState) {
          Future.delayed(Duration(seconds: 3), () {
            GoRouter.of(context).pushReplacement(AppRoute.kWelcomeView);
          });
        } else if (state is SplashFailureState) {
          Fluttertoast.showToast(msg: state.errorMessage);
        }
      },
      child: Animate(
        child: Stack(children: [
          Positioned(
              top: 220,
              left: 0,
              child: SvgPicture.asset(AssetsManager.newBack, height: 300)),
          Positioned.fill(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 220),
                    child: Center(
                        child: SvgPicture.asset(
                      AssetsManager.logoImage,
                      height: size.height * 0.17,
                    )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<SplashBloc, SplashState>(
                    builder: (context, state) {
                      if (state is SplashSuccessState) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget(
                              title:
                                  '${state.splashResponseEntity.splashData!.channelName}'
                                  ' ${state.splashResponseEntity.splashData!.lastWorkingVer}'
                                  ' ${state.splashResponseEntity.splashData!.copyright}',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightTitleColor,
                            ),
                          ],
                        );
                      } else if (state is SplashFailureState) {
                        return CustomTextWidget(title: state.errorMessage);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                ]).animate(delay: Duration(seconds: 5)),
          )
        ]),
      ),
    );
    ;
  }
}
