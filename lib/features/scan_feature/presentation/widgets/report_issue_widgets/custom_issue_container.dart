import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/commom_bloc/keyboard_bloc/custom_keyboard_bloc.dart';
import '../../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/assets_manager.dart';
import 'custom_decorated_text_line.dart';
import 'custom_issue_text_field.dart';

class CustomIssueContainer extends StatelessWidget {
  const CustomIssueContainer({
    super.key,
    required this.keyForm,
    required this.carNum,
    required this.carLetter,
    this.validatorNum,
    this.validatorLetter,
    required this.letterNode,
    required this.numberNode,
    this.onLetterFieldSubmitted,
    this.onNumberFieldSubmitted,
    this.keyBoardLetterType,
  });
  final GlobalKey<FormState> keyForm;
  final TextEditingController carNum;
  final TextEditingController carLetter;
  final String? Function(String?)? validatorNum;
  final String? Function(String?)? validatorLetter;
  final void Function(String)? onLetterFieldSubmitted;
  final void Function(String)? onNumberFieldSubmitted;
  final FocusNode letterNode;
  final FocusNode numberNode;
  final TextInputType? keyBoardLetterType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Card(
        elevation: 1,
        shadowColor: Colors.grey.shade300,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubTitleWidget(
                subTitle: AppStrings.enterVehicleNumber,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGrey,
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderContainerColor, width: 2)),
                child: Form(
                  key: keyForm,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    child: Row(
                      children: [
                        Flexible(
                            flex: 3,
                            child: CustomIssueTextField(
                              onFieldSubmitted: onNumberFieldSubmitted,
                              focusNode: numberNode,
                              keyBoardType: TextInputType.number,
                              controller: carNum,
                              validator: validatorNum,
                              maxLength: 4,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.5),
                          child: Column(
                            children: [
                              SvgPicture.asset(AssetsManager.ksaLogo),
                              SvgPicture.asset(AssetsManager.plateLogo)
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: CustomIssueTextField(
                            onTapLetter: () {
                              context.read<CustomKeyboardBloc>().add(SetKeyboardLengthEvent(
                                  textEditingController: carLetter, length: 3));
                            },
                            onFieldSubmitted: onLetterFieldSubmitted,
                            focusNode: letterNode,
                            keyBoardType: TextInputType.none,
                            maxLength: 3,
                            controller: carLetter,
                            validator: validatorLetter,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 6,
                    child: CustomDecoratedTextLine(title: AppStrings.number),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 5,
                    child: CustomDecoratedTextLine(title: AppStrings.letters),
                  ),
                ],
              ),
              // letterNode.hasFocus
              //     ? CustomKeyBoard(
              //     controller: carLetter,
              //     focusNode: letterNode)
              //     : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
