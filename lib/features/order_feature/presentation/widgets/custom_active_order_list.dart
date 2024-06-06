import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

import '../../../home_feature/presentation/widgets/active_orders_item.dart';
import '../../../home_feature/presentation/widgets/item_model.dart';

class CustomActiveOrderList extends StatelessWidget {
  const CustomActiveOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollShadow(
      color: Colors.grey.shade400,
      size: 15,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                itemCount: ItemList.activeOrdersList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.7, vertical: 8),
                      child: ActiveOrdersItem(
                          image: ItemList.activeOrdersList[index].image,
                          color: ItemList.activeOrdersList[index].color));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
