import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/app_colors.dart';

class CustomMeterContainer extends StatelessWidget {
  const CustomMeterContainer({
    super.key,
    required this.node,
    required this.controller,
    this.onFieldSubmitted,
    this.validator,
    this.keyBoardType,
    this.maxLength,
    required this.image,
    this.onEditingCompletes,
  });

  final FocusNode node;
  final TextEditingController controller;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final int? maxLength;
  final String image;
  final Function()? onEditingCompletes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: TextFormField(
            onEditingComplete: onEditingCompletes,
            textInputAction: TextInputAction.next,
            controller: controller,
            focusNode: node,
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyBoardType,
            validator: validator,
            textAlign: TextAlign.center,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            maxLength: maxLength,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            textCapitalization: TextCapitalization.characters,
            style: const TextStyle(
                color: AppColors.greyColor,
                fontSize: 17,
                letterSpacing: 4.0,
                decoration: TextDecoration.none,
                decorationThickness: 0),
            decoration: InputDecoration(
                hintText: '000',
                hintStyle: const TextStyle(color: AppColors.orderNumberColor),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: SvgPicture.asset(
                    image,
                  ),
                ),
                counter: const Offstage(),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: AppColors.orderNumberColor)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: AppColors.orderNumberColor)),
                errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: AppColors.redColor)),
                focusedErrorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: AppColors.redColor))),
          )),
    );
  }
}
