import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/commom_bloc/keyboard_bloc/custom_keyboard_bloc.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../report_issue_widgets/custom_issue_text_field.dart';

class VehicleDetailsPlateContainer extends StatelessWidget {
  const VehicleDetailsPlateContainer(
      {super.key,
      required this.keyForm,
      required this.carNum,
      required this.carLetter,
      this.validatorNum,
      this.validatorLetter,
      this.onLetterFieldSubmitted,
      this.onNumberFieldSubmitted,
      required this.letterNode,
      required this.numberNode});

  final GlobalKey<FormState> keyForm;
  final TextEditingController carNum;
  final TextEditingController carLetter;
  final String? Function(String?)? validatorNum;
  final String? Function(String?)? validatorLetter;
  final void Function(String)? onLetterFieldSubmitted;
  final void Function(String)? onNumberFieldSubmitted;
  final FocusNode letterNode;
  final FocusNode numberNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderContainerColor, width: 1.5)),
      child: Form(
        key: keyForm,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 11),
          child: Center(
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
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Column(
                    children: [
                      SvgPicture.asset(AssetsManager.ksaLogo),
                      SvgPicture.asset(AssetsManager.plateLogo)
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: CustomIssueTextField(
                      onTapLetter: () {
                        // showModalBottomSheet(
                        //     backgroundColor: Colors.transparent,
                        //     barrierColor: Colors.transparent,
                        //     isDismissible: true,
                        //     context: context,
                        //     builder:(context){
                        //       return Container(
                        //           height: 30.h,
                        //           child: letterNode.hasFocus?CustomKeyBoard(controller: carLetter, focusNode: letterNode):Container());
                        //     });
                        context.read<CustomKeyboardBloc>().add(
                            SetKeyboardLengthEvent(textEditingController: carLetter, length: 3));
                      },
                      onFieldSubmitted: onLetterFieldSubmitted,
                      focusNode: letterNode,
                      keyBoardType: TextInputType.none,
                      maxLength: 3,
                      controller: carLetter,
                      validator: validatorLetter,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
