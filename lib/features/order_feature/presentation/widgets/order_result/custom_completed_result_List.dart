import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../completed_order_item.dart';
import '../completed_orders_model.dart';

class CustomCompletedResultList extends StatelessWidget {
  const CustomCompletedResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: ScrollShadow(
          color: Colors.grey.shade400,
          size: 15,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0.2),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12), topLeft: Radius.circular(12)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 15,
                            blurStyle: BlurStyle.normal,
                          )
                        ]),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: CompletedItemList.completedOrderList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1.2),
                          child: CompletedOrdersItem(
                              image: CompletedItemList.completedOrderList[index].image,
                              color: CompletedItemList.completedOrderList[index].color),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
