import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_regular_appbar.dart';
import 'package:sayarah/features/drawer_inner_screens/widgets/about_app_widgets/about_app_body.dart';
import '../../core/component/custom_drawer.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(mainTitle: AppStrings.aboutApp, actionTitle: AppStrings.back)),
      body: AboutAppBody(),
    );
  }
}
