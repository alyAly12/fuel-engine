import 'package:flutter/material.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';

class WelcomeTwo extends StatelessWidget {
  const WelcomeTwo({
    super.key,
  });
// final String image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextWidget(
            title: AppStrings.welcomeHeaderTwo,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor,
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          SizedBox(
            height: size.height * 0.25,
            child: Image.asset(
              AssetsManager.secondPage,
            ),
          ),
          SubTitleWidget(
            subTitle: AppStrings.firstWelcome,
            maxLines: 3,
            fontSize: 15,
            color: AppColors.welcomeScript,
            align: TextAlign.center,
          )
        ],
      ),
    );
  }
}
