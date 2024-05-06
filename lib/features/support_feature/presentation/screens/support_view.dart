import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_regular_appbar.dart';
import 'package:sayarah/core/utils/app_strings.dart';

import '../../../../core/component/custom_drawer.dart';
import '../widgets/support_view_body.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.support,
            actionTitle: 'Back',
            isVisi: true,
          )),
      body: SupportViewBody(),
    );
  }
}
