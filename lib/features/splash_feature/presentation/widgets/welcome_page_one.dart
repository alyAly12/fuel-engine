import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';

class WelcomeOne extends StatelessWidget {
  const WelcomeOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          CustomTextWidget(
            title: AppStrings.welcomeHeaderOne,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor,
          ),
          SizedBox(
            height: size.height * 0.033,
          ),
          SvgPicture.asset(
            AssetsManager.welcomeImage,
            height: size.height * 0.2,
          ),
          SizedBox(
            height: size.height * 0.03,
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
