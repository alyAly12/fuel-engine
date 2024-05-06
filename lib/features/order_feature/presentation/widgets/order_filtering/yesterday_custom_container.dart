import 'package:flutter/material.dart';
import 'package:sayarah/features/order_feature/presentation/widgets/order_filtering/yesterday_container.dart';
import '../../../../../../core/functions/pick_time.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import 'custom_filter_text_field.dart';

class YesterdayCustomContainer extends StatefulWidget {
  const YesterdayCustomContainer({
    super.key,
  });

  @override
  State<YesterdayCustomContainer> createState() => _YesterdayCustomContainerState();
}

class _YesterdayCustomContainerState extends State<YesterdayCustomContainer> {
  late TextEditingController toController;
  late TextEditingController fromController;
  @override
  void initState() {
    toController = TextEditingController();
    fromController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    toController.dispose();
    fromController.dispose();
    super.dispose();
  }

  bool _yesterdayPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: CustomFilterTextField(
                enabled: _yesterdayPressed,
                controller: toController,
                fillColor: _yesterdayPressed ? Colors.white : const Color(0xffe6eaee),
                labelText: AppStrings.from,
                onTap: () async {
                  await pickTime(controller: toController, context: context);
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Flexible(
              flex: 1,
              child: CustomFilterTextField(
                enabled: _yesterdayPressed,
                controller: fromController,
                fillColor: _yesterdayPressed ? Colors.white : const Color(0xffe6eaee),
                labelText: AppStrings.to,
                onTap: () async {
                  await pickTime(controller: fromController, context: context);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
