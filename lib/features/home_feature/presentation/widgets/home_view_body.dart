import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';

import '../../../../../core/component/subtitle_text_widget.dart';
import 'active_orders_item.dart';
import 'custom_app_bar.dart';
import 'custom_home_box.dart';
import 'empty_home_screen.dart';
import 'item_model.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        shadowColor: Colors.grey.shade300,
        backgroundColor: Colors.transparent,
        pinned: true,
        floating: true,
        toolbarHeight: kToolbarHeight * 3.18,
        // expandedHeight: size.height * 0.049.h,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                color: AppColors.backGroundColor, border: Border.fromBorderSide(BorderSide.none)),
            child: Column(
              children: [
                Expanded(
                  child: Stack(children: [
                    CustomAppBar(),
                    Positioned(top: 112, left: 10, right: 10, child: CustomHomeBox()),
                  ]),
                ),
                Visibility(
                  visible: ItemList.activeOrdersList.isEmpty ? false : true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextWidget(
                        title: AppStrings.activeOrders,
                        color: AppColors.lightTitleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.pieChartColor,
                        radius: 11,
                        child: SubTitleWidget(
                          subTitle: '${ItemList.activeOrdersList.length}',
                          color: AppColors.homeBox,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
      SliverPadding(
        padding: EdgeInsets.zero,
        sliver: SliverFillRemaining(
          hasScrollBody: true,
          fillOverscroll: true,
          child: ScrollShadow(
            color: Colors.grey.shade300,
            size: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ItemList.activeOrdersList.isEmpty
                    ? const EmptyHomeScreen()
                    : Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: false,
                            itemCount: ItemList.activeOrdersList.length,
                            itemBuilder: (context, index) {
                              return ActiveOrdersItem(
                                  image: ItemList.activeOrdersList[index].image,
                                  color: ItemList.activeOrdersList[index].color);
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Divider(
                                  thickness: 0.5,
                                  color: Colors.grey.shade300,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
