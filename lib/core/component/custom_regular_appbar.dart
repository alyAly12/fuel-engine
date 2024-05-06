import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_colors.dart';
import 'custom_text_widget.dart';

class CustomRegularAppBar extends StatelessWidget {
  const CustomRegularAppBar({
    super.key,
    required this.mainTitle,
    required this.actionTitle,
    this.textSize,
    this.isVisi = true,
  });
  final String mainTitle;

  final String? actionTitle;
  final double? textSize;
  final bool isVisi;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Visibility(
          visible: isVisi,
          child: TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: CustomTextWidget(
              title: actionTitle ?? '',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.cancelTitleColor,
            ),
          ),
        ),
      ],
      centerTitle: true,
      title: CustomTextWidget(
        title: mainTitle,
        fontSize: textSize ?? 17,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: AppColors.deepRed,
      leading: Builder(builder: (context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ));
      }),
    );
  }
}
