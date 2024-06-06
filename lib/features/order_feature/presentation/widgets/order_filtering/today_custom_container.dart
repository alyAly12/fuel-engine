import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fuelsystem/features/order_feature/presentation/widgets/order_filtering/today_date_container.dart';
import 'package:fuelsystem/features/order_feature/presentation/widgets/order_filtering/yesterday_container.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/functions/pick_time.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_route.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../core/component/custom_button.dart';
import 'custom_filter_text_field.dart';
import 'order_product_list.dart';
import 'order_type_list.dart';

class TodayCustomTextField extends StatefulWidget {
  const TodayCustomTextField({
    super.key,
  });

  @override
  State<TodayCustomTextField> createState() => _TodayCustomTextFieldState();
}

class _TodayCustomTextFieldState extends State<TodayCustomTextField> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController toController;
  late TextEditingController fromController;
  late TextEditingController yesterdayFromController;
  late TextEditingController yesterdayToController;
  @override
  void initState() {
    toController = TextEditingController();
    fromController = TextEditingController();
    yesterdayFromController = TextEditingController();
    yesterdayToController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    toController.dispose();
    fromController.dispose();
    yesterdayFromController.dispose();
    yesterdayToController.dispose();
    super.dispose();
  }

  bool _todayPressed = false;
  bool _yesterdayPressed = false;
  Future<void> applyFunction() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      if (_todayPressed == false && _yesterdayPressed == false) {
        Fluttertoast.showToast(
            msg: "Please select a day",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.appBarColor,
            textColor: Colors.white,
            fontSize: 16.0);
        return;
      }
      GoRouter.of(context).pushReplacement(AppRoute.kFilterResultScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TodayDateContainer(
                buttonColor: _todayPressed ? AppColors.redColor : Colors.white,
                titleColor: _todayPressed ? Colors.white : AppColors.appBarColor,
                border: _todayPressed
                    ? Border.all(color: Colors.transparent, width: 0.7)
                    : Border.all(color: AppColors.orderNumberColor, width: 0.7),
                onTap: () {
                  setState(() {
                    _todayPressed = !_todayPressed;
                  });
                },
                containerName: AppStrings.today,
              ),
              const SizedBox(
                width: 15,
              ),
              YesterdayContainer(
                buttonColor: _yesterdayPressed ? AppColors.redColor : Colors.white,
                titleColor: _yesterdayPressed ? Colors.white : AppColors.appBarColor,
                border: _yesterdayPressed
                    ? Border.all(color: Colors.transparent, width: 0.7)
                    : Border.all(color: AppColors.orderNumberColor, width: 0.7),
                onTap: () {
                  setState(() {
                    _yesterdayPressed = !_yesterdayPressed;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: CustomFilterTextField(
                  enabled: _todayPressed || _yesterdayPressed,
                  controller: toController,
                  fillColor:
                      _todayPressed || _yesterdayPressed ? Colors.white : const Color(0xffe6eaee),
                  labelText: AppStrings.from,
                  onTap: () async {
                    await pickTime(controller: toController, context: context);
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Flexible(
                flex: 1,
                child: CustomFilterTextField(
                  enabled: _todayPressed || _yesterdayPressed,
                  controller: fromController,
                  fillColor:
                      _todayPressed || _yesterdayPressed ? Colors.white : const Color(0xffe6eaee),
                  labelText: AppStrings.to,
                  onTap: () async {
                    await pickTime(controller: fromController, context: context);
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextWidget(
            title: AppStrings.orderType,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ),
          const SizedBox(
            height: 20,
          ),
          const OrderTypeList(),
          const SizedBox(
            height: 30,
          ),
          CustomTextWidget(
            title: AppStrings.product,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ),
          const SizedBox(
            height: 20,
          ),
          const OrderProductList(),
          const SizedBox(
            height: 80,
          ),
          CustomLoginButton(
            buttonHeight: size.width * 0.12,
            color: (_todayPressed || _yesterdayPressed)
                ? AppColors.redColor
                : AppColors.orderNumberColor,
            onPressed: () {
              applyFunction();
            },
            title: AppStrings.apply,
            textSize: 17,
            textWeight: FontWeight.w500,
            showIcon: false,
          ),
        ],
      ),
    );
  }
}
