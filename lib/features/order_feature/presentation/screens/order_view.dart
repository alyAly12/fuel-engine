import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_drawer.dart';
import 'package:sayarah/core/component/custom_regular_appbar.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';

import '../widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.orders,
            actionTitle: '',
          )),
      body: const OrderViewBody(),
    );
  }
}
