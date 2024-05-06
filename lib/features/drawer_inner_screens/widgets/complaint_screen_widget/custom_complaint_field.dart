import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';

import '../../../../core/utils/app_colors.dart';

class CustomComplainField extends StatelessWidget {
  const CustomComplainField(
      {super.key, required this.fieldController, this.hintTitle, this.maxLine = 1});
  final TextEditingController fieldController;
  final hintTitle;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      controller: fieldController,
      decoration: InputDecoration(
        error: CustomTextWidget(
          title: 'This field is Required',
          fontSize: 11,
          color: Colors.red,
        ),
        hintText: hintTitle,
        hintStyle: TextStyle(color: AppColors.blackCoat, fontSize: 13),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orderNumberColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orderNumberColor),
        ),
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orderNumberColor),
        ),
      ),
    );
  }
}
