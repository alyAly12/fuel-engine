import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/assets_manager.dart';

class LastVisitDetailWidget extends StatelessWidget {
  const LastVisitDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AssetsManager.gasPump,
            height: 18,
          ),
          const SizedBox(
            width: 20,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                title: '30 L (Fuel 91)',
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              CustomTextWidget(
                title: 'F000123',
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ],
          ),
          const SizedBox(
            width: 35,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SubTitleWidget(
                subTitle: '70 SAR',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.orderNumberColor,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTextWidget(
                title: 'Sun Jul 9, 2023 10:14 am',
                color: AppColors.appBarColor,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
