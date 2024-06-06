import 'package:flutter/material.dart';
import '../../../../core/component/custom_drawer.dart';
import '../../../../core/component/custom_regular_appbar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/setting_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.setting,
            actionTitle: 'Back',
            isVisi: true,
          )),
      body: const SettingViewBody(),
    );
  }
}
