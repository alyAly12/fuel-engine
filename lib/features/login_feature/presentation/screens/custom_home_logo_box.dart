import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import '../../../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_strings.dart';

class CustomHomeBoxLogo extends StatelessWidget {
  const CustomHomeBoxLogo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 16,
            child: SvgPicture.asset(
              AssetsManager.sascoLogo,
              height: 60,
            )),
        SizedBox(
          width: size.width * 0.02,
        ),
        SubTitleWidget(
          subTitle: AppStrings.chillOut,
          color: AppColors.greyColor,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        )
      ],
    );
  }
}
