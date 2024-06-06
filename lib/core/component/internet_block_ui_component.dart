
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/app_consts.dart';
import 'custom_text_widget.dart';
final dialogContextCompleter = Completer<BuildContext>();

void InternetBlocUI(BuildContext context)async{
  showDialog<void>(
    barrierColor: Colors.white60,
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      if(!dialogContextCompleter.isCompleted) {
        dialogContextCompleter.complete(dialogContext);
      }
      return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SvgPicture.asset('assets/images/4g.svg',height: 80,),
        const SizedBox(height: 50,),
        const CustomTextWidget(title: 'no connection found',color: AppColors.redColor,fontSize: 16,),
          const SizedBox(height: 20,),
        const CustomTextWidget(title: 'kindly check data connection or WiFi network',color: AppColors.appBarColor,fontSize: 13,)
      ],);
    },
  );
  // final dialogContext = await dialogContextCompleter.future;
  // Navigator.pop(dialogContext);
}