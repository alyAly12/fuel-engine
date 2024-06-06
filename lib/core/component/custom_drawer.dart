import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_colors.dart';
import '../utils/app_route.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';
import 'custom_text_button.dart';
import 'custom_text_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Positioned(
            left: 140,
            bottom: MediaQuery.of(context).size.height * 0.14,
            child: SvgPicture.asset(
              AssetsManager.redSide,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned.fill(
            top: 80,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SvgPicture.asset(AssetsManager.closeIcon),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextButton(
                  title: AppStrings.home,
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRoute.kRootScreen);
                  },
                  textSize: 15,
                  textColor: const Color(0xff545e69),
                ),
                // CustomTextButton(title: AppStrings.orders, onPressed: (){GoRouter.of(context).push(AppRoute.kOrderView);},textSize:8.sp,textColor: Color(0xff545e69)),
                CustomTextButton(
                    title: AppStrings.setting,
                    onPressed: () {
                      GoRouter.of(context).push(AppRoute.kSettingsView);
                    },
                    textSize: 15,
                    textColor: const Color(0xff545e69)),
                CustomTextButton(
                    title: AppStrings.device,
                    onPressed: () {
                      GoRouter.of(context).push(AppRoute.kDeviceScreen);
                    },
                    textSize: 15,
                    textColor: const Color(0xff545e69)),
                CustomTextButton(
                    title: AppStrings.help,
                    onPressed: () {
                      GoRouter.of(context).push(AppRoute.kSupportView);
                    },
                    textSize: 15,
                    textColor: const Color(0xff545e69)),
                CustomTextButton(
                    title: AppStrings.aboutTheApp,
                    onPressed: () {
                      GoRouter.of(context).push(AppRoute.kAboutAppScreen);
                    },
                    textSize: 15,
                    textColor: const Color(0xff545e69)),

                const SizedBox(
                  height: 1,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 1, right: 12),
                  child: Divider(
                    thickness: 1,
                    color: AppColors.orderNumberColor,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoute.kComplaintScreen);
                  },
                  child: CustomTextWidget(
                    title: AppStrings.sendComplain,
                    color: const Color(0xff545e69),
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: CustomTextWidget(
                    title: AppStrings.logOut,
                    color: AppColors.redColor,
                    fontSize: 15,
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 60, horizontal: 3),
                  child: CustomTextWidget(
                    title: '',
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: AppColors.orderNumberColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
