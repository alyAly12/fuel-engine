import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_route.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import 'package:sayarah/core/component/custom_rounded_column_button.dart';

class IssueSentScreen extends StatefulWidget {
  const IssueSentScreen({super.key});

  @override
  State<IssueSentScreen> createState() => _IssueSentScreenState();
}

class _IssueSentScreenState extends State<IssueSentScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _lottieController;

  @override
  void initState() {
    _lottieController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _lottieController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(AssetsManager.check,
                height: 18, controller: _lottieController, repeat: false, animate: true),
            SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CustomTextWidget(
                title: AppStrings.issueSent,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGrey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRoundedColumnButton(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    color: AppColors.pieChartColor,
                    image: AssetsManager.addIcon2,
                    text: AppStrings.newOrder,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomRoundedColumnButton(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRoute.kRootScreen);
                    },
                    color: AppColors.blackCoat,
                    image: AssetsManager.house,
                    text: AppStrings.home,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
