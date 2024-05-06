import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_regular_appbar.dart';
import 'package:sayarah/features/drawer_inner_screens/widgets/device_screen_widgets/device_screen_body.dart';
import '../../core/component/custom_drawer.dart';
import '../../core/utils/app_colors.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
          child: CustomRegularAppBar(mainTitle: 'Device', actionTitle: 'Back')),
      body: DeviceScreenBody(),
    );
  }
}
