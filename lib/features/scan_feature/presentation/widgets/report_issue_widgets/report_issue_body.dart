import 'package:flutter/material.dart';
import 'package:fuelsystem/features/scan_feature/presentation/widgets/report_issue_widgets/report_issue_list.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/component/custom_keyboard.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/utils/app_route.dart';
import '../../../../../../core/utils/auth_validator.dart';
import '../../../../../core/component/custom_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import 'custom_issue_container.dart';

class ReportIssueViewBody extends StatefulWidget {
  const ReportIssueViewBody({super.key});

  @override
  State<ReportIssueViewBody> createState() => _ReportIssueViewBodyState();
}

class _ReportIssueViewBodyState extends State<ReportIssueViewBody> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController vehicleNumber;
  late TextEditingController vehicleLetter;
  late FocusNode numberNode;
  late FocusNode letterNode;
  @override
  void initState() {
    vehicleNumber = TextEditingController();
    vehicleLetter = TextEditingController();
    numberNode = FocusNode();
    letterNode = FocusNode();
    letterNode.addListener(() {
      _onFocusChange();
    });
    super.initState();
  }

  @override
  void dispose() {
    vehicleLetter.dispose();
    vehicleNumber.dispose();
    numberNode.dispose();
    letterNode
      ..removeListener(() {
        _onFocusChange();
      })
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  Future<void> submitIssue() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      GoRouter.of(context).pushReplacement(AppRoute.kIssueSentScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIssueContainer(
              keyForm: formKey,
              carNum: vehicleNumber,
              carLetter: vehicleLetter,
              validatorNum: (value) {
                return AuthValidator.vehicleNumberValidator(value);
              },
              validatorLetter: (value) {
                return AuthValidator.vehicleLetterValidator(value);
              },
              letterNode: letterNode,
              numberNode: numberNode,
              onLetterFieldSubmitted: (value) {
                vehicleLetter == value;
              },
              onNumberFieldSubmitted: (value) {
                vehicleNumber == value;
              },
              keyBoardLetterType: TextInputType.text,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 14),
              child: CustomTextWidget(
                title: AppStrings.enterIssue,
                color: AppColors.appBarColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              child: ReportIssueList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: CustomLoginButton(
                  textSize: 17,
                  textWeight: FontWeight.w500,
                  buttonHeight: 55,
                  onPressed: () {
                    submitIssue();
                  },
                  color: AppColors.redColor,
                  title: AppStrings.send,
                  showIcon: false),
            ),
            letterNode.hasFocus
                ? CustomKeyBoard(controller: vehicleLetter, focusNode: letterNode)
                : Container(),
          ],
        ),
      ),
    );
  }
}
