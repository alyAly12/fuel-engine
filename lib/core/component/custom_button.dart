import 'package:flutter/material.dart';

import '../../../../../core/component/custom_text_widget.dart';
import '../utils/app_colors.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key,
    required this.onPressed,
    this.color,
    required this.title,
    required this.showIcon,
    this.buttonHeight,
    this.textSize = 16,
    this.textColor = Colors.white,
    this.textWeight,
  });

  final void Function() onPressed;
  final Color? color;
  final String title;
  final bool showIcon;
  final double? buttonHeight;
  final double? textSize;
  final Color? textColor;
  final FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: SizedBox(
        width: size.width,
        height: buttonHeight,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color??AppColors.deepRed ,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  title: title,
                  fontSize: textSize ?? 16,
                  fontWeight: textWeight ?? FontWeight.w300,
                  color: textColor,
                ),
                Visibility(
                    visible: showIcon,
                    child: const Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.white,
                      size: 20,
                    ))
              ],
            )),
      ),
    );
  }
}
