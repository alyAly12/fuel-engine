import 'package:flutter/material.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';

import '../../../../core/component/subtitle_text_widget.dart';
import '../widgets/welcome_view_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: GestureDetector(
            onTap: () {},
            child: SubTitleWidget(
              subTitle: AppStrings.pass,
              color: AppColors.welcomeScript,
              fontSize: 15,
            )),
      ),
      body: const WelcomeViewBody(),
    );
  }
}
