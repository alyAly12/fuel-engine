import 'package:flutter/material.dart';
import 'package:sayarah/core/utils/app_strings.dart';

import '../../../../../core/component/custom_text_widget.dart';

class CustomActiveButton extends StatelessWidget {
  const CustomActiveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextWidget(
            title: AppStrings.active,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
