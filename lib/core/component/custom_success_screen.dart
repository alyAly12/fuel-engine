import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../utils/app_colors.dart';
import '../utils/app_route.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';
import 'custom_rounded_column_button.dart';
import 'custom_text_widget.dart';

class CustomSuccessScreen extends StatelessWidget {
  const CustomSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 15),
        child: Column(
          children: [
            Lottie.asset(AssetsManager.check, height: 20),
            SizedBox(
              height: 10,
            ),
            CustomTextWidget(
              title: AppStrings.messageSent,
              fontSize: 10,
              color: AppColors.appBarColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomRoundedColumnButton(
                      onTap: () {
                        GoRouter.of(context).pushReplacement(AppRoute.kScanView);
                      },
                      Height: 4,
                      titleColor: AppColors.appBarColor,
                      color: AppColors.pieChartColor,
                      image: AssetsManager.addIcon2,
                      text: AppStrings.newOrder),
                  CustomRoundedColumnButton(
                      onTap: () {
                        GoRouter.of(context).pushReplacement(AppRoute.kRootScreen);
                      },
                      Height: 4,
                      titleColor: AppColors.appBarColor,
                      color: AppColors.blackCoat,
                      image: AssetsManager.house,
                      text: AppStrings.home)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
