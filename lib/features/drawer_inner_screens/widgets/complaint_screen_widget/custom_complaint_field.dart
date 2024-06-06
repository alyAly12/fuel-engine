import 'package:flutter/material.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';

class CustomComplainField extends StatelessWidget {
  const CustomComplainField(
      {super.key, required this.fieldController, this.hintTitle, this.maxLine = 1});
  final TextEditingController fieldController;
  final String? hintTitle;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      controller: fieldController,
      decoration: InputDecoration(
        error: const CustomTextWidget(
          title: 'This field is Required',
          fontSize: 11,
          color: Colors.red,
        ),
        hintText: hintTitle,
        hintStyle: const TextStyle(color: AppColors.blackCoat, fontSize: 13),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orderNumberColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orderNumberColor),
        ),
        enabled: true,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orderNumberColor),
        ),
      ),
    );
  }
}
