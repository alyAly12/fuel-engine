import 'package:flutter/material.dart';

import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_strings.dart';

class CustomCompletedButton extends StatelessWidget {
  const CustomCompletedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomTextWidget(
        title: AppStrings.completed,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      SizedBox.shrink()
    ]);
  }
}
