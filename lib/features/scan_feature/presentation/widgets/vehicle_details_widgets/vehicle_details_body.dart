import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/component/custom_rounded_row_button.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_route.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/core/utils/assets_manager.dart';

import 'custom_vehicle_detail_card.dart';

class VehicleDetailsBody extends StatelessWidget {
  const VehicleDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomVehicleDetailCard(),
        SizedBox(
          height: 70,
        ),
        CustomTextWidget(
          title: AppStrings.areYouSure,
          color: AppColors.redColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.deepRed, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomRoundedRowButton(
                      onTap: () {
                        GoRouter.of(context).pushReplacement(AppRoute.kNotSameVehicleScreen);
                      },
                      color: AppColors.redColor,
                      titleColor: AppColors.deepRed,
                      image: AssetsManager.close,
                      text: AppStrings.notTheSame),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: AppColors.pieChartColor),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomRoundedRowButton(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRoute.kSameVehicleScreen);
                    },
                    color: AppColors.pieChartColor,
                    image: AssetsManager.yes,
                    text: AppStrings.sure,
                    titleColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
