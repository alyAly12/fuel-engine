import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import '../../../../core/component/custom_text_widget.dart';
import '../widgets/report_issue_widgets/report_issue_body.dart';

class ReportIssueScreen extends StatelessWidget {
  const ReportIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: CustomTextWidget(
                title: AppStrings.cancel,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: ReportIssueViewBody(),
      ),
    );
  }
}
