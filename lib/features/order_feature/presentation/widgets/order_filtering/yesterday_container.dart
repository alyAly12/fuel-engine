import 'package:flutter/material.dart';
import 'package:sayarah/core/utils/app_strings.dart';

import '../../../../../../core/component/custom_text_widget.dart';

class YesterdayContainer extends StatelessWidget {
  const YesterdayContainer(
      {super.key,
      required this.buttonColor,
      required this.titleColor,
      required this.border,
      required this.onTap});

  final Color buttonColor;
  final Color titleColor;
  final BoxBorder border;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(20), border: border),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: CustomTextWidget(
            title: AppStrings.yesterday,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
