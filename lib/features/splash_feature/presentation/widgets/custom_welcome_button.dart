import 'package:flutter/material.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomWelcomeButton extends StatelessWidget {
  const CustomWelcomeButton({super.key, required this.title, this.onPressed});
  final String title;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppColors.redColor, width: 2))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                title: title,
                color: AppColors.redColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.arrow_forward_sharp,
                color: Colors.grey,
                size: 20,
              ),
            ],
          )),
    );
  }
}
