import 'package:flutter/material.dart';
import 'package:sayarah/core/utils/app_colors.dart';

import 'custom_active_button.dart';
import 'custom_active_order_list.dart';
import 'custom_complete_order_list.dart';
import 'custom_completed_button.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> with TickerProviderStateMixin {
  late TabController controller;

  List<Widget> tabItems = [
    const CustomActiveButton(),
    const CustomCompletedButton(),
  ];
  List<Widget> tabView = [
    const CustomActiveOrderList(),
    const CustomCompleteOrderList(),
  ];
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1),
      child: Column(
        children: [
          TabBar(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            tabAlignment: TabAlignment.fill,
            splashFactory: NoSplash.splashFactory,
            unselectedLabelColor: AppColors.lightTitleColor,
            splashBorderRadius: BorderRadius.circular(14),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
            indicatorWeight: 0,
            labelStyle: const TextStyle(color: AppColors.deepRed),
            unselectedLabelStyle: const TextStyle(color: AppColors.lightTitleColor),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              shape: BoxShape.rectangle,
              color: AppColors.splashColor,
            ),
            controller: controller,
            tabs: tabItems,
          ),
          SizedBox(
            height: 0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TabBarView(clipBehavior: Clip.none, controller: controller, children: tabView),
            ),
          )
        ],
      ),
    );
  }
}
