import 'package:flutter/material.dart';

import '../../../../../../core/component/custom_regular_appbar.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../core/component/custom_drawer.dart';
import '../../../../../core/utils/app_colors.dart';
import 'help_and_support_widgets/help_and_support_body.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      drawer: const CustomDrawer(),
      key: scaffoldKey,
      appBar: PreferredSize(
          preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.help,
            actionTitle: AppStrings.back,
          )),
      body: const HelpAndSupportBody(),
    );
  }
}
