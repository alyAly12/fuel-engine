import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import '../../../../../core/utils/app_route.dart';
import 'completed_order_item.dart';
import 'completed_orders_model.dart';

class CustomCompleteOrderList extends StatelessWidget {
  const CustomCompleteOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        floatingActionButton: FloatingActionButton(
            heroTag: 'btn2',
            backgroundColor: Colors.white,
            onPressed: () {
              GoRouter.of(context).push(AppRoute.kOrderFilter);
            },
            shape: const CircleBorder(),
            child: SvgPicture.asset(AssetsManager.filterImage)),
        body: ScrollShadow(
          color: Colors.grey.shade400,
          size: 15,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: CompletedItemList.completedOrderList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: CompletedOrdersItem(
                            image: CompletedItemList.completedOrderList[index].image,
                            color: CompletedItemList.completedOrderList[index].color),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
