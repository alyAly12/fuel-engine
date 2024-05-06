import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';

class CustomGradientContainer extends StatelessWidget {
  const CustomGradientContainer(
      {super.key, required this.color, required this.firstTitle, required this.secTitle});
  final List<Color> color;
  final String firstTitle;
  final String secTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: color)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
            title: firstTitle,
            fontSize: 13,
            color: AppColors.appBarColor,
          ),
          CustomTextWidget(
            title: secTitle,
            fontSize: 15,
            color: AppColors.appBarColor,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
