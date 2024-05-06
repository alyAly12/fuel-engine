import 'package:flutter/material.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget(
      {super.key,
      required this.subTitle,
      this.fontSize = 18,
      this.fontStyle = FontStyle.normal,
      this.fontWeight = FontWeight.normal,
      this.color,
      this.textDecoration = TextDecoration.none,
      this.maxLines = 2,
      this.align});

  final String subTitle;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDecoration;
  final int? maxLines;
  final TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: align,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          decoration: textDecoration),
    );
  }
}
