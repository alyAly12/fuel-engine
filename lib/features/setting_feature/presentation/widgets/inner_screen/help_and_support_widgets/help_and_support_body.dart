import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../../../core/component/custom_button.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_route.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/auth_validator.dart';
import 'custom_help_text_form.dart';

class HelpAndSupportBody extends StatefulWidget {
  const HelpAndSupportBody({super.key});

  @override
  State<HelpAndSupportBody> createState() => _HelpAndSupportBodyState();
}

class _HelpAndSupportBodyState extends State<HelpAndSupportBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController messageController;
  late FocusNode titleNode;
  late FocusNode messageNode;

  @override
  void initState() {
    titleController = TextEditingController();
    messageController = TextEditingController();
    titleNode = FocusNode();
    messageNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
    titleNode.dispose();
    messageNode.dispose();
    super.dispose();
  }

  Future<void> sendHelp() async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      GoRouter.of(context).pushReplacement(AppRoute.kCustomSuccessScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 20.0)]),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextWidget(
                  title: AppStrings.title,
                  color: AppColors.orderNumberColor,
                  fontSize: 15,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomHelpTextForm(
                  controller: titleController,
                  hintText: 'Enter',
                  fieldNode: titleNode,
                  onSubmitted: (value) {
                    titleController.text == value;
                  },
                  validatorField: (value) {
                    return AuthValidator.titleValidator(value);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextWidget(
                  title: AppStrings.message,
                  color: AppColors.orderNumberColor,
                  fontSize: 15,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomHelpTextForm(
                  maxLines: 5,
                  controller: messageController,
                  hintText: 'Message',
                  fieldNode: messageNode,
                  onSubmitted: (value) {
                    messageController.text == value;
                  },
                  validatorField: (value) {
                    return AuthValidator.messageValidator(value);
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomLoginButton(
                    buttonHeight: 50,
                    textSize: 17,
                    textWeight: FontWeight.w500,
                    onPressed: () {
                      sendHelp();
                    },
                    color: AppColors.redColor,
                    title: AppStrings.send,
                    showIcon: true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
