
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';

import '../utils/app_consts.dart';
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
        SizedBox(height: 50,),
        CustomTextWidget(title: 'no connection found',color: AppColors.redColor,fontSize: 16,),
          SizedBox(height: 20,),
        CustomTextWidget(title: 'kindly check data connection or WiFi network',color: AppColors.appBarColor,fontSize: 13,)
      ],);
    },
  );
  // final dialogContext = await dialogContextCompleter.future;
  // Navigator.pop(dialogContext);
}