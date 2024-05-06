import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_route.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/features/drawer_inner_screens/widgets/complaint_screen_widget/complaint_header_container.dart';
import 'package:sayarah/features/drawer_inner_screens/widgets/complaint_screen_widget/custom_complaint_field.dart';
import 'package:sayarah/core/component/custom_button.dart';

class ComplaintScreenBody extends StatefulWidget {
  const ComplaintScreenBody({super.key});

  @override
  State<ComplaintScreenBody> createState() => _ComplaintScreenBodyState();
}

class _ComplaintScreenBodyState extends State<ComplaintScreenBody> {
  late TextEditingController title;
  late TextEditingController message;

  @override
  void initState() {
    title = TextEditingController();
    message = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    message.dispose();
    super.dispose();
  }

  Future<void> submitIssue() async {
    if (title.text.isEmpty && message.text.isEmpty) {
      return;
    } else {
      GoRouter.of(context).pushReplacement(AppRoute.kIssueSentScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ComplaintHeaderContainer(),
          SizedBox(
            height: 35,
          ),
          CustomTextWidget(
            title: AppStrings.complaintTitle,
            fontSize: 15,
            color: AppColors.appBarColor,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 20,
          ),
          CustomComplainField(
            fieldController: title,
            hintTitle: AppStrings.title,
          ),
          SizedBox(
            height: 35,
          ),
          CustomTextWidget(
            title: AppStrings.complaintMessage,
            fontSize: 15,
            color: AppColors.appBarColor,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 20,
          ),
          CustomComplainField(
            fieldController: message,
            hintTitle: AppStrings.enterDetails,
            maxLine: 5,
          ),
          SizedBox(
            height: 55,
          ),
          CustomLoginButton(
              buttonHeight: 50,
              textSize: 17,
              textWeight: FontWeight.w500,
              onPressed: () {
                submitIssue();
              },
              title: AppStrings.send,
              showIcon: true)
        ],
      ),
    );
  }
}
