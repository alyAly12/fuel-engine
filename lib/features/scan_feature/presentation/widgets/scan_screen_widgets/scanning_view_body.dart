import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/component/custom_text_button.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import 'package:sayarah/features/scan_feature/presentation/widgets/scan_screen_widgets/scan_header_container.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/utils/app_route.dart';

class ScanningViewBody extends StatelessWidget {
  const ScanningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScanHeaderContainer(),
          SizedBox(
            height: 20,
          ),
          CustomTextButton(
              title: 'Unknown',
              textSize: 17,
              onPressed: () {
                GoRouter.of(context).push(AppRoute.kRegistrationScreen);
              }),
          Spacer(),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoute.kReportIssue);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetsManager.errorMark,
                ),
                SizedBox(
                  width: 1,
                ),
                CustomTextWidget(
                  title: AppStrings.reportIssue,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
