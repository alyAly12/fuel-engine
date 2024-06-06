import 'package:flutter/material.dart';

import '../../../../../../core/component/custom_toggle_button.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';

class OrderProductList extends StatefulWidget {
  const OrderProductList({
    super.key,
  });

  @override
  State<OrderProductList> createState() => _OrderProductListState();
}

class _OrderProductListState extends State<OrderProductList> {
  bool _gas91 = false;
  bool _gas95 = false;
  bool _diesel = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CustomToggleButton(
              productType: AppStrings.gsa91,
              buttonColor: _gas91 ? AppColors.redColor : Colors.white,
              titleColor: _gas91 ? Colors.white : AppColors.appBarColor,
              border: _gas91
                  ? Border.all(color: Colors.transparent, width: 0.7)
                  : Border.all(color: AppColors.orderNumberColor, width: 0.7),
              onTap: () {
                setState(() {
                  _gas91 = !_gas91;
                });
              },
              radius: BorderRadius.circular(20),
            ),
            const SizedBox(
              height: 6,
            ),
            CustomToggleButton(
              productType: AppStrings.diesel,
              buttonColor: _diesel ? AppColors.redColor : Colors.white,
              titleColor: _diesel ? Colors.white : AppColors.appBarColor,
              border: _diesel
                  ? Border.all(color: Colors.transparent, width: 0.7)
                  : Border.all(color: AppColors.orderNumberColor, width: 0.7),
              onTap: () {
                setState(() {
                  _diesel = !_diesel;
                });
              },
              radius: BorderRadius.circular(20),
            )
          ],
        ),
        const SizedBox(width: 4),
        CustomToggleButton(
          productType: AppStrings.gas95,
          buttonColor: _gas95 ? AppColors.redColor : Colors.white,
          titleColor: _gas95 ? Colors.white : AppColors.appBarColor,
          border: _gas95
              ? Border.all(color: Colors.transparent, width: 0.7)
              : Border.all(color: AppColors.orderNumberColor, width: 0.7),
          onTap: () {
            setState(() {
              _gas95 = !_gas95;
            });
          },
          radius: BorderRadius.circular(20),
        )
      ],
    );
  }
}
