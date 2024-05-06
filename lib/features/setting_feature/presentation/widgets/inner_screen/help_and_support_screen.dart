import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_drawer.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import '../../../../../../core/component/custom_regular_appbar.dart';
import '../../../../../../core/utils/app_strings.dart';
import 'help_and_support_widgets/help_and_support_body.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      drawer: CustomDrawer(),
      key: _scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.help,
            actionTitle: AppStrings.back,
          )),
      body: HelpAndSupportBody(),
    );
  }
}
