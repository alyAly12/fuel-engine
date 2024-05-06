import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarah/core/utils/assets_manager.dart';

import 'custom_text_widget.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
    required this.productType,
    required this.buttonColor,
    required this.titleColor,
    required this.border,
    required this.onTap,
    required this.radius,
    this.textSize = 11,
    this.textWeight = FontWeight.w600,
    this.showIcon = false,
  });
  final String productType;
  final Color buttonColor;
  final Color titleColor;
  final BoxBorder border;
  final Function onTap;
  final BorderRadiusGeometry radius;
  final double textSize;
  final FontWeight? textWeight;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(color: buttonColor, borderRadius: radius, border: border),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(
                title: productType,
                fontSize: textSize,
                fontWeight: textWeight,
                color: titleColor,
              ),
              SizedBox(
                width: 4,
              ),
              Visibility(
                  visible: showIcon,
                  child: SvgPicture.asset(
                    AssetsManager.rightSign,
                    height: 10,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
