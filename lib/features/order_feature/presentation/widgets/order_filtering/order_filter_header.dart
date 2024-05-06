import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';

import '../../../../../../core/component/custom_text_widget.dart';

class OrderFilerHeader extends StatelessWidget {
  const OrderFilerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          title: AppStrings.orderFilter,
          fontWeight: FontWeight.normal,
          fontSize: 17,
          color: Colors.black,
        ),
        GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(
              Icons.clear,
              color: AppColors.redColor,
              size: 30,
            ))
      ],
    );
  }
}
