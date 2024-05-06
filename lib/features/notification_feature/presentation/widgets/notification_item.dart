import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets_manager.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AssetsManager.danger,
            height: 20,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                title: 'System requirements',
                fontSize: 15,
              ),
              CustomTextWidget(
                title: 'New update in refund policy',
                fontSize: 13,
                color: AppColors.lightTitleColor,
              )
            ],
          ),
          Spacer(),
          CustomTextWidget(title: '2 days ago', fontSize: 13, color: AppColors.lightTitleColor)
        ],
      ),
    );
  }
}
