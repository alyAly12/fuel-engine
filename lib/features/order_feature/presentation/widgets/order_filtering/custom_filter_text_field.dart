import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class CustomFilterTextField extends StatelessWidget {
  const CustomFilterTextField(
      {super.key,
      required this.enabled,
      required this.controller,
      required this.fillColor,
      required this.labelText,
      this.onTap});
  final bool enabled;
  final TextEditingController controller;
  final Color fillColor;
  final String labelText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      readOnly: true,
      showCursor: false,
      onTap: onTap,
      controller: controller,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 12),
          labelText: labelText,
          labelStyle: const TextStyle(color: AppColors.orderNumberColor, fontSize: 13),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.orderNumberColor))),
    );
  }
}
