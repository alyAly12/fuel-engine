import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/assets_manager.dart';

class SupportViewBody extends StatelessWidget {
  const SupportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset(AssetsManager.soon)),
        SizedBox(height: 4),
        CustomTextWidget(
          title: 'SOON..',
          color: AppColors.appBarColor,
        )
      ],
    );
  }
}
