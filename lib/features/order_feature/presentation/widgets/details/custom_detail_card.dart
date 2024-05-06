import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/assets_manager.dart';

class CustomDetailsCard extends StatelessWidget {
  const CustomDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: AppColors.backGroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 25,
              offset: Offset(1, 1),
              blurStyle: BlurStyle.outer,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsManager.gasPump,
                  height: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      title: AppStrings.orderNumber,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: AppColors.orderNumberColor,
                    ),
                    SizedBox(
                      height: 0.01,
                    ),
                    const CustomTextWidget(
                      title: 'DE45435t',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
                SizedBox(
                  width: 1,
                ),
                const Spacer(),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.appBarColor,
                      child: SvgPicture.asset(
                        AssetsManager.supportWhite,
                        height: 15,
                      ),
                    ),
                    CustomTextWidget(
                      title: AppStrings.complain,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: AppColors.orderNumberColor,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 3.5,
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 10,
                  decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.grey.shade300)),
                ),
                const SizedBox(
                  width: 13,
                ),
                Column(
                  children: [
                    CustomTextWidget(
                      title: AppStrings.vehicleNumber,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: AppColors.orderNumberColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextWidget(
                      title: '7403 RUA',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: AppColors.appBarColor,
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      title: AppStrings.fuelType,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: AppColors.orderNumberColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextWidget(
                      title: '92',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: AppColors.appBarColor,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: '30 L (Fuel 91)',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.appBarColor,
                ),
                CustomTextWidget(
                  title: '70 SAR',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.pieChartColor,
                ),
                SizedBox(
                  width: 30,
                ),
                const CustomTextWidget(
                  title: 'Sun Jul 9, 2023 @10:14 am',
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: AppColors.orderNumberColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
