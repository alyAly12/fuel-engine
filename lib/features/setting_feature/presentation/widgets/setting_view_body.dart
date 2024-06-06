import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuelsystem/features/setting_feature/presentation/widgets/setting_list.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/commom_bloc/theme_cubit/theme_cubit.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../core/component/custom_toggle_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/utils/app_strings.dart';

class SettingViewBody extends StatefulWidget {
  const SettingViewBody({super.key});

  @override
  State<SettingViewBody> createState() => _SettingViewBodyState();
}

class _SettingViewBodyState extends State<SettingViewBody> {
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingList(
            title: AppStrings.profileInformation,
            onTap: () {
              GoRouter.of(context).push(AppRoute.kProfileInfoScreen);
            },
          ),
          SettingList(
            title: AppStrings.termsAndConditions,
            onTap: () {
              GoRouter.of(context).push(AppRoute.kTermsScreen);
            },
          ),
          SettingList(
            title: AppStrings.help,
            onTap: () {
              GoRouter.of(context).push(AppRoute.kHelpScreen);
            },
          ),
          const SizedBox(
            height: 25,
          ),
          const Divider(
            thickness: 1,
            color: AppColors.orderNumberColor,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextWidget(
            title: AppStrings.language,
            color: AppColors.appBarColor,
            fontSize: 15,
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomToggleButton(
                    textSize: 15,
                    showIcon: true,
                    productType: AppStrings.english,
                    buttonColor: AppColors.appBarColor,
                    titleColor: Colors.white,
                    border: Border.all(color: AppColors.appBarColor),
                    onTap: () {
                      setState(() {
                        context.setLocale(const Locale('en', 'US'));
                      });
                    },
                    radius: BorderRadius.circular(12)),
                const SizedBox(
                  width: 10,
                ),
                CustomToggleButton(
                    textSize: 15,
                    showIcon: true,
                    productType: AppStrings.urdu,
                    buttonColor: AppColors.appBarColor,
                    titleColor: Colors.white,
                    border: Border.all(color: AppColors.appBarColor),
                    onTap: () {
                      setState(() {
                        context.setLocale(const Locale('ur', 'UR'));
                      });
                    },
                    radius: BorderRadius.circular(12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
