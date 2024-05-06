import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../../core/component/custom_text_widget.dart';

class TodayDateContainer extends StatelessWidget {
  const TodayDateContainer(
      {super.key,
      required this.buttonColor,
      required this.titleColor,
      required this.border,
      required this.onTap,
      required this.containerName});
  final Color buttonColor;
  final Color titleColor;
  final BoxBorder border;
  final Function onTap;
  final String containerName;
  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    var dateFormat = DateFormat('dd MMM').format(now);
    final String formatted = dateFormat;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(20), border: border),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(
                title: containerName,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
              const SizedBox(
                width: 5,
              ),
              CustomTextWidget(
                  title: formatted, fontSize: 11, fontWeight: FontWeight.w600, color: titleColor)
            ],
          ),
        ),
      ),
    );
  }
}
