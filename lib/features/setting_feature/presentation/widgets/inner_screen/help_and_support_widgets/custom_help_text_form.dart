import 'package:flutter/material.dart';
import '../../../../../../../core/utils/app_colors.dart';

class CustomHelpTextForm extends StatelessWidget {
  const CustomHelpTextForm(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validatorField,
      this.onSubmitted,
      required this.fieldNode,
      this.maxLines = 1});
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validatorField;
  final void Function(String)? onSubmitted;
  final FocusNode fieldNode;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: TextFormField(
        maxLines: maxLines,
        focusNode: fieldNode,
        controller: controller,
        validator: validatorField,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD1DBE2)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff96A6B2)),
          ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: AppColors.redColor)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: AppColors.redColor)),
          errorStyle: const TextStyle(fontSize: 14, color: AppColors.redColor),
          hintText: hintText,
          border: InputBorder.none,
        ),
        onFieldSubmitted: onSubmitted,
      ),
    );
  }
}
