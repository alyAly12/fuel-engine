import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import 'custom_text_widget.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.title, required this.onPressed, this.textSize, this.textColor});
  final void Function() onPressed;
  final String title;
  final double? textSize;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(8),
          minimumSize: const Size(50, 45),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.centerLeft),
      child: CustomTextWidget(
        title: title,
        color: textColor ?? AppColors.orderNumberColor,
        fontSize: textSize ?? 10,
      ),
    );
  }
}
