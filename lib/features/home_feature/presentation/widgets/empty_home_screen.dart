import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/component/subtitle_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';

class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.1,
        ),
        Lottie.asset(AssetsManager.noOrderLottie, fit: BoxFit.cover, height: size.height * 0.2),
        SubTitleWidget(
          subTitle: AppStrings.emptyScreenTitle,
          fontSize: 15,
          color: AppColors.lightTitleColor,
          fontWeight: FontWeight.normal,
        )
      ],
    );
  }
}
