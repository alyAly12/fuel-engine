import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayarah/core/component/subtitle_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';

class CustomRoundedRowButton extends StatelessWidget {
  const CustomRoundedRowButton(
      {super.key,
      required this.color,
      this.onTap,
      required this.image,
      required this.text,
      this.titleColor});
  final Color color;
  final void Function()? onTap;
  final String image;
  final String text;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            image,
          ),
          SizedBox(
            width: 10,
          ),
          SubTitleWidget(
            subTitle: text,
            fontSize: 15,
            color: titleColor ?? AppColors.blackCoat,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
