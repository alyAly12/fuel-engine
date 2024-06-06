import 'package:flutter/material.dart';


import '../../../../core/component/custom_drawer.dart';
import '../../../../core/component/custom_regular_appbar.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/support_view_body.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.support,
            actionTitle: 'Back',
            isVisi: true,
          )),
      body: const SupportViewBody(),
    );
  }
}
