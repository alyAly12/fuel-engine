import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      required this.title,
      this.fontSize = 20,
      this.maxLines,
      this.color,
      this.fontWeight});
  final String title;
  final double fontSize;
  final int? maxLines;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
        decoration: TextDecoration.none,
          color: color,
          fontSize: fontSize,
          fontFamily: 'Roboto',
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis),
    );
  }
}
