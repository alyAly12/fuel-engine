import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';


class ToTextField extends StatelessWidget {
  const ToTextField({
    super.key,
    required this.controllerTo,
    this.onTap,
    this.enableField,
    required this.fillColor,
  });
  final TextEditingController controllerTo;
  final void Function()? onTap;
  final bool? enableField;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enableField,
      readOnly: true,
      showCursor: false,
      onTap: onTap,
      controller: controllerTo,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
          labelText: AppStrings.to,
          labelStyle: const TextStyle(color: AppColors.orderNumberColor, fontSize: 13),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.orderNumberColor))),
    );
  }
}
