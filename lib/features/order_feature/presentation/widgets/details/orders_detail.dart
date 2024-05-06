import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_drawer.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import '../../../../../../core/component/custom_regular_appbar.dart';
import 'orders_details_body.dart';

class OrdersDetail extends StatelessWidget {
  const OrdersDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.ordersDetail,
            actionTitle: AppStrings.back,
          )),
      body: const OrdersDetailsBody(),
    );
  }
}
