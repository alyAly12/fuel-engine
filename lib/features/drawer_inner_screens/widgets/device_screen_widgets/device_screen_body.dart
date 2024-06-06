import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import 'device_screen_header.dart';


class DeviceScreenBody extends StatelessWidget {
  const DeviceScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DeviceScreenHeader(),
          const SizedBox(
            height: 60,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: AppColors.pieChartColor,
                      size: 30,
                    ),
                    CustomTextWidget(
                      title: AppStrings.activationDate,
                      color: AppColors.pieChartColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const CustomTextWidget(
                  title: '2 may 2013 12:40 PM',
                  color: AppColors.darkGrey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
      Positioned(top: 80, right: 50, child: SvgPicture.asset(AssetsManager.deviceShot))
    ]);
  }
}
