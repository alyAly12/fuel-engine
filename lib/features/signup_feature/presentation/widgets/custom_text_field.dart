import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.onEditingComplete,
    this.validator,
    this.hintText,
    this.onlyRead = false,
    this.styles, this.nextAction = TextInputAction.next,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final bool onlyRead;
  final TextStyle? styles;
  final TextInputAction? nextAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: onlyRead,
      textInputAction: nextAction,
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      keyboardType: TextInputType.multiline,
      validator: validator,
      style: const TextStyle(color: AppColors.greyColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: styles,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD1DBE2)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff96A6B2)),
        ),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.redColor)),
        errorStyle: const TextStyle(fontSize: 14, color: AppColors.redColor),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppColors.redColor)),
      ),
    );
  }
}
