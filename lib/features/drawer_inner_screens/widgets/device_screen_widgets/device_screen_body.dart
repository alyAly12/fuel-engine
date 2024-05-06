import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import 'package:sayarah/features/drawer_inner_screens/widgets/device_screen_widgets/device_screen_header.dart';

class DeviceScreenBody extends StatelessWidget {
  const DeviceScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DeviceScreenHeader(),
          SizedBox(
            height: 60,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
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
                CustomTextWidget(
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
