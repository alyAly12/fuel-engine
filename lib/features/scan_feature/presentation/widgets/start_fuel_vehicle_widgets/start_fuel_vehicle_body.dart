import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sayarah/core/component/custom_rounded_column_button.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_route.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/core/utils/assets_manager.dart';

class StartFuelVehicleBody extends StatelessWidget {
  const StartFuelVehicleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            AssetsManager.redRectangle,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
            top: 35,
            right: 0,
            child: TextButton(
                onPressed: () {},
                child: CustomTextWidget(
                  title: 'Back',
                  color: Colors.white,
                  fontSize: 15,
                ))),
        Positioned.fill(
          top: 130,
          child: Column(
            children: [
              Lottie.asset(AssetsManager.fuelStation),
              SizedBox(
                height: 20,
              ),
              CustomTextWidget(
                title: AppStrings.onProgress,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomRoundedColumnButton(
                        onTap: () {
                          GoRouter.of(context).pushReplacement(AppRoute.kConfirmFuelAmount);
                        },
                        Height: 25,
                        color: AppColors.stopColor,
                        image: AssetsManager.rightSign,
                        text: AppStrings.finish),
                    CustomRoundedColumnButton(
                        onTap: () {
                          GoRouter.of(context).pushReplacement(AppRoute.kScanView);
                        },
                        Height: 25,
                        color: AppColors.pieChartColor,
                        image: AssetsManager.addIcon,
                        text: AppStrings.newOrder),
                    CustomRoundedColumnButton(
                        onTap: () {
                          GoRouter.of(context).pushReplacement(AppRoute.kRootScreen);
                        },
                        Height: 25,
                        color: AppColors.blackCoat,
                        image: AssetsManager.house,
                        text: AppStrings.home),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
