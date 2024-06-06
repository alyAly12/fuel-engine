import 'package:flutter/material.dart';
import 'package:fuelsystem/features/order_feature/presentation/widgets/order_filtering/today_custom_container.dart';

import 'order_filter_header.dart';

class OrderFilter extends StatelessWidget {
  const OrderFilter({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderFilerHeader(),
              SizedBox(height: 30),
              TodayCustomTextField(),
            ],
          ),
        ),
      )),
    );
  }
}
