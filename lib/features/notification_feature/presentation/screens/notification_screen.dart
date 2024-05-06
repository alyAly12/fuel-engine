import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_drawer.dart';
import 'package:sayarah/core/component/custom_regular_appbar.dart';
import 'package:sayarah/core/utils/app_strings.dart';

import '../widgets/notification_screen_body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
              mainTitle: AppStrings.notification, actionTitle: AppStrings.back)),
      body: NotificationScreenBody(),
    );
  }
}
