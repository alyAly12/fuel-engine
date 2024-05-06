import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';

import '../../../../../../core/component/custom_text_widget.dart';
import 'custom_detail_card.dart';
import 'last_visit_detail.dart';

class OrdersDetailsBody extends StatelessWidget {
  const OrdersDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomDetailsCard(),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CustomTextWidget(
              title: AppStrings.lastVisit,
              color: AppColors.appBarColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Expanded(
            child: ScrollShadow(
              color: Colors.grey.shade300,
              size: 10,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                          child: const LastVisitDetailWidget(),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
