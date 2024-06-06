import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../completed_order_item.dart';
import '../completed_orders_model.dart';
import 'custom_completed_result_List.dart';
import 'custom_gradient_row.dart';

class OrderResultBody extends StatefulWidget {
  const OrderResultBody({super.key});

  @override
  State<OrderResultBody> createState() => _OrderResultBodyState();
}

class _OrderResultBodyState extends State<OrderResultBody> with TickerProviderStateMixin {
  late TabController controller;

  List<Widget> tabItems = [const SizedBox.shrink(), const SizedBox.shrink()];
  List<Widget> tabView = [
    const CustomCompletedResultList(),
  ];

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomGradientContainer(color: const [
                Color.fromRGBO(186, 218, 241, 1),
                Color.fromRGBO(233, 255, 251, 1),
              ], firstTitle: AppStrings.orders, secTitle: '120'),
              CustomGradientContainer(color: const [
                Color.fromRGBO(186, 218, 241, 1),
                Color.fromRGBO(233, 255, 251, 1),
              ], firstTitle: AppStrings.liters, secTitle: '500'),
              CustomGradientContainer(color: const [
                Color.fromRGBO(134, 230, 201, 1),
                Color.fromRGBO(233, 255, 251, 1),
              ], firstTitle: AppStrings.total, secTitle: '2345'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomTextWidget(
            title: 'Sun Jul 9, 2023 10:14 am - 5:00 pm',
            fontSize: 13,
            color: AppColors.lightTitleColor,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ScrollShadow(
              color: Colors.grey.shade300,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CompletedOrdersItem(
                        image: CompletedItemList.completedOrderList[index].image,
                        color: CompletedItemList.completedOrderList[index].color);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                  itemCount: 10),
            ),
          ),
        ],
      ),
    );
  }
}
