import 'package:flutter/material.dart';
import '../../../../../core/component/custom_drawer.dart';
import '../../../../../core/component/custom_regular_appbar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import 'order_result/order_result_body.dart';

class OrderFilterResult extends StatelessWidget {
  const OrderFilterResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
          preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.orders,
            actionTitle: AppStrings.back,
          )),
      body: OrderResultBody(),
    );
  }
}
