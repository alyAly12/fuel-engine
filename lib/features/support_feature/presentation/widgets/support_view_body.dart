import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';


class SupportViewBody extends StatelessWidget {
  const SupportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset(AssetsManager.soon)),
        const SizedBox(height: 4),
        const CustomTextWidget(
          title: 'SOON..',
          color: AppColors.appBarColor,
        )
      ],
    );
  }
}
