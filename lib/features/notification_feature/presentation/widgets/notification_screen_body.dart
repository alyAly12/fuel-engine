import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import 'notification_item.dart';

class NotificationScreenBody extends StatelessWidget {
  const NotificationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return const NotificationItem();
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 0.5,
                  color: AppColors.lightTitleColor,
                );
              },
              itemCount: 6),
        )
      ],
    );
  }
}
