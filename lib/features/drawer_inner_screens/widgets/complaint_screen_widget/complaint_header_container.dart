import 'package:flutter/material.dart';

import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class ComplaintHeaderContainer extends StatelessWidget {
  const ComplaintHeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration:
          BoxDecoration(color: AppColors.orderNumberColor, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                title: AppStrings.orderNumber,
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextWidget(
                title: 'F00123',
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
          const SizedBox(
            width: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                title: AppStrings.vehicleNumber,
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextWidget(
                title: '7403 RUA',
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ],
      ),
    );
  }
}
