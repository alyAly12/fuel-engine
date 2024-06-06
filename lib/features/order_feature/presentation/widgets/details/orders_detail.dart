import 'package:flutter/material.dart';
import '../../../../../../core/component/custom_regular_appbar.dart';
import '../../../../../core/component/custom_drawer.dart';
import '../../../../../core/utils/app_strings.dart';
import 'orders_details_body.dart';

class OrdersDetail extends StatelessWidget {
  const OrdersDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.ordersDetail,
            actionTitle: AppStrings.back,
          )),
      body: const OrdersDetailsBody(),
    );
  }
}
