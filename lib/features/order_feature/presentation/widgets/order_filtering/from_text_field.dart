import 'package:flutter/material.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';

class FromTextField extends StatelessWidget {
  const FromTextField({
    super.key,
    required this.controllerFrom,
    this.onTap,
    this.enableField,
    required this.fillColor,
  });
  final TextEditingController controllerFrom;
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
      controller: controllerFrom,
      decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(10, 18, 5, 0),
          labelText: AppStrings.from,
          labelStyle: const TextStyle(color: AppColors.orderNumberColor, fontSize: 13),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.orderNumberColor))),
    );
  }
}
