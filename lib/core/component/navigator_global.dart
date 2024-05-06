
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_route.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import 'package:toastification/toastification.dart';

import 'custom_text_widget.dart';

class GlobalNavigator {
  static showAlertDialog(
      {required String text,
      required IconData goIcon,
      required Color bkColor,
      required Color iconColor}) {
    showDialog(
      barrierDismissible: false,
      context: AppRoute.currentContext,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bkColor,
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          content: Container(
            height: 5,
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(text),
                SizedBox(
                  width: 2,
                ),
                Icon(
                  goIcon,
                  color: iconColor,
                ),
                SizedBox(
                  width: 1,
                ),
                VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('ok'))
              ],
            ),
          ),
        );
      },
    );
  }

  static showNotificationDialog(
      {required String text,
        required IconData icon,
      required Color bkColor,
      required Color iconColor}) {
    toastification.showCustom(
      context: AppRoute.globalContext,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: bkColor,
          ),
          padding: const EdgeInsets.all(22),
          margin: const EdgeInsets.all(8),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsManager.location),
                SizedBox(
                  width: 2,
                ),
                SvgPicture.asset(AssetsManager.nfcMark),
                SizedBox(
                  width: 2,
                ),
                SvgPicture.asset(AssetsManager.fiveG),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Connection Activated', style: TextStyle(color: AppColors.pieChartColor,fontSize: 14)),
                    Text(text, style: TextStyle(color: AppColors.appBarColor,fontSize: 14))
                  ],
                ),
                SizedBox(width: 10,),
                Align(
                  alignment:Alignment.bottomCenter,
                    child: Icon(icon,color: iconColor,)),
                SizedBox(
                  width: 20,
                ),
                VerticalDivider(thickness: 1,color: AppColors.blackCoat),
                SizedBox(
                  width: 20,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text('Ok',style: TextStyle(fontSize: 12),))
              ],
            ),
          ),
        );
      },
    );




    // toastification.show(
    //   context: AppRoute.globalContext,
    //   style: ToastificationStyle.flatColored,
    //   autoCloseDuration: const Duration(days: 3),
    //   // you can also use RichText widget for title and description parameters
    //   description: Row(
    //     children: [
    //       SvgPicture.asset(AssetsManager.location),
    //       SizedBox(
    //         width: 2,
    //       ),
    //       SvgPicture.asset(AssetsManager.nfcMark),
    //       SizedBox(
    //         width: 2,
    //       ),
    //       SvgPicture.asset(AssetsManager.fiveG),
    //       SizedBox(
    //         width: 10,
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text('Connection Activated', style: TextStyle(color: AppColors.appBarColor)),
    //           Text(text, style: TextStyle(color: AppColors.appBarColor))
    //         ],
    //       ),
    //
    //       SizedBox(width: 5,),
    //       SizedBox(
    //         width: 10,
    //       ),
    //       Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Text('Ok'))
    //       ],
    //   ),
    //   alignment: Alignment.bottomRight,
    //   direction: TextDirection.ltr,
    //   primaryColor: iconColor,
    //   backgroundColor: bkColor,
    //   foregroundColor: Colors.black,
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    //   margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    //   borderRadius: BorderRadius.circular(12),
    //   boxShadow: const [
    //     BoxShadow(
    //       color: Color(0x07000000),
    //       blurRadius: 16,
    //       offset: Offset(0, 16),
    //       spreadRadius: 0,
    //     )
    //   ],
    //   showProgressBar: false,
    //   closeButtonShowType: CloseButtonShowType.onHover,
    //   closeOnClick: true,
    //   pauseOnHover: false,
    //   dragToClose: true,
    //   applyBlurEffect: true,
    // );
  }
}

class GlobalInternetNavigator {

  static showAlertDialog(
      {required String text,
        required IconData goIcon,
        required Color bkColor,
        required Color iconColor}) {
    showDialog(
      barrierColor: Colors.white.withOpacity(0.95),
      barrierDismissible: false,
      context: AppRoute.globalContext,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AssetsManager.noConnectionLottie,width: 129,height: 129),
            SizedBox(height: 50,),
            CustomTextWidget(title: 'no connection found',color: AppColors.redColor,fontSize: 20,),
            SizedBox(height: 20,),
            CustomTextWidget(title: 'kindly check data connection or WiFi network',color: AppColors.appBarColor,fontSize: 14,)
          ],);
      },
    );
  }

}

