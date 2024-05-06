import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import 'order_type_widget.dart';

class OrderTypeList extends StatefulWidget {
  const OrderTypeList({
    super.key,
  });

  @override
  State<OrderTypeList> createState() => _OrderTypeListState();
}

class _OrderTypeListState extends State<OrderTypeList> {
  bool _fuelType = false;
  bool _oilType = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OrderTypeWidget(
          type: AppStrings.fuel,
          onTap: () {
            setState(() {
              _fuelType = !_fuelType;
            });
          },
          buttonColor: _fuelType ? AppColors.redColor : Colors.white,
          titleColor: _fuelType ? Colors.white : AppColors.appBarColor,
          border: _fuelType
              ? Border.all(color: Colors.transparent, width: 0.7)
              : Border.all(color: AppColors.orderNumberColor, width: 0.7),
        ),
        SizedBox(
          width: 3,
        ),
        OrderTypeWidget(
          type: AppStrings.oil,
          onTap: () {
            setState(() {
              _oilType = !_oilType;
            });
          },
          buttonColor: _oilType ? AppColors.redColor : Colors.white,
          titleColor: _oilType ? Colors.white : AppColors.appBarColor,
          border: _oilType
              ? Border.all(color: Colors.transparent, width: 0.7)
              : Border.all(color: AppColors.orderNumberColor, width: 0.7),
        )
      ],
    );
  }
}
