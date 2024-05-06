import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import '../../../../core/utils/app_colors.dart';

class AboutAppBody extends StatelessWidget {
  const AboutAppBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(AssetsManager.appLogo),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  title: '',
                  fontSize: 13,
                  color: AppColors.smallTitle,
                ),
              ],
            ),
          ]),
    );
  }
}
