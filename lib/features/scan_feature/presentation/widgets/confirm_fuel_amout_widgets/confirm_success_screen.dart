import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sayarah/core/component/custom_rounded_column_button.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/utils/app_route.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/assets_manager.dart';

class ConfirmSuccessScreen extends StatelessWidget {
  const ConfirmSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            AssetsManager.backGroundImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            top: 12,
            child: Column(
              children: [
                Lottie.asset(AssetsManager.check),
                SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  title: AppStrings.orderSuccess,
                  fontSize: 9,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomRoundedColumnButton(
                          onTap: () {
                            GoRouter.of(context).pushReplacement(AppRoute.kScanView);
                          },
                          Height: 4,
                          titleColor: Colors.white,
                          color: AppColors.pieChartColor,
                          image: AssetsManager.addIcon2,
                          text: AppStrings.newOrder),
                      CustomRoundedColumnButton(
                          onTap: () {
                            GoRouter.of(context).pushReplacement(AppRoute.kRootScreen);
                          },
                          Height: 4,
                          titleColor: Colors.white,
                          color: AppColors.blackCoat,
                          image: AssetsManager.house,
                          text: AppStrings.home)
                    ],
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
