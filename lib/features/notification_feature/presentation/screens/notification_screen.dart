import 'package:flutter/material.dart';


import '../../../../core/component/custom_drawer.dart';
import '../../../../core/component/custom_regular_appbar.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/notification_screen_body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(
              mainTitle: AppStrings.notification, actionTitle: AppStrings.back)),
      body: const NotificationScreenBody(),
    );
  }
}
