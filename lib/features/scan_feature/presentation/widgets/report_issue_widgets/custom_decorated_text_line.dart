import 'package:flutter/material.dart';
import '../../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomDecoratedTextLine extends StatelessWidget {
  const CustomDecoratedTextLine({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 0.1,
              decoration: const BoxDecoration(color: AppColors.orderNumberColor),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: SubTitleWidget(
                subTitle: title,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.orderNumberColor,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 0.1,
              decoration: const BoxDecoration(color: AppColors.orderNumberColor),
            ),
          ),
        ],
      ),
    );
  }
}
