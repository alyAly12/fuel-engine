import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../core/utils/app_colors.dart';

class CustomIssueTextField extends StatelessWidget {
  const CustomIssueTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.validator,
    this.keyBoardType,
    this.inputFormatters,
    this.maxLength,
    this.onFieldSubmitted,
    this.hintText = '',
    this.onTapLetter,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? hintText;
  final Function()? onTapLetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTapLetter,
      textInputAction: TextInputAction.next,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyBoardType,
      validator: validator,
      textAlign: TextAlign.center,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      textCapitalization: TextCapitalization.characters,
      onChanged: (txt) {},
      style: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 20,
          letterSpacing: 4.0,
          decoration: TextDecoration.none,
          decorationThickness: 0),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              const TextStyle(color: AppColors.greyColor, fontSize: 28, fontWeight: FontWeight.w500),
          counter: const Offstage(),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: AppColors.issueBorderColor)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: AppColors.issueBorderColor)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: AppColors.redColor)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: AppColors.redColor))),
    );
  }
}
