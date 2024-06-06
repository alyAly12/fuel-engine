import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_route.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/scan_screen_widgets/scanning_view_body.dart';

class ScanningView extends StatelessWidget {
  const ScanningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () async {
              GoRouter.of(context).pushReplacement(AppRoute.kRootScreen);
              await Future.delayed(const Duration(seconds: 1));
              await FlutterNfcKit.finish();
            },
            child: CustomTextWidget(
              title: AppStrings.cancel,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const ScanningViewBody(),
    );
  }
}
