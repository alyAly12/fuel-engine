import 'package:flutter/material.dart';

import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class DeviceScreenHeader extends StatelessWidget {
  const DeviceScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(color: AppColors.orderNumberColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: AppStrings.deviceCode,
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextWidget(
              title: 'H23T67Y',
              fontSize: 25,
              color: AppColors.blackCoat,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 110,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.pieChartColor,
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: CustomTextWidget(
                  title: AppStrings.activeDevice,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
