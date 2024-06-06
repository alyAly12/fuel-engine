import 'package:flutter/material.dart';

import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../../core/utils/app_colors.dart';

class CustomDetailColumn extends StatelessWidget {
  const CustomDetailColumn(
      {super.key,
      required this.title,
      required this.subTitle,
      this.titleColor = AppColors.greyColor});
  final String title;
  final String subTitle;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleWidget(
          subTitle: title,
          fontSize: 15,
          color: AppColors.orderNumberColor,
        ),
        const SizedBox(
          height: 1,
        ),
        CustomTextWidget(
          title: subTitle,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: titleColor,
        )
      ],
    );
  }
}
