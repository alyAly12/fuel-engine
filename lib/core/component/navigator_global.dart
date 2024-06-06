
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'package:toastification/toastification.dart';

import '../utils/app_colors.dart';
import '../utils/app_route.dart';
import '../utils/assets_manager.dart';
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
          contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          content: SizedBox(
            height: 5,
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(text),
                const SizedBox(
                  width: 2,
                ),
                Icon(
                  goIcon,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 1,
                ),
                const VerticalDivider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('ok'))
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
                const SizedBox(
                  width: 2,
                ),
                SvgPicture.asset(AssetsManager.nfcMark),
                const SizedBox(
                  width: 2,
                ),
                SvgPicture.asset(AssetsManager.fiveG),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Connection Activated', style: TextStyle(color: AppColors.pieChartColor,fontSize: 14)),
                    Text(text, style: const TextStyle(color: AppColors.appBarColor,fontSize: 14))
                  ],
                ),
                const SizedBox(width: 10,),
                Align(
                  alignment:Alignment.bottomCenter,
                    child: Icon(icon,color: iconColor,)),
                const SizedBox(
                  width: 20,
                ),
                const VerticalDivider(thickness: 1,color: AppColors.blackCoat),
                const SizedBox(
                  width: 20,
                ),
                const Align(
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
            const SizedBox(height: 50,),
            const CustomTextWidget(title: 'no connection found',color: AppColors.redColor,fontSize: 20,),
            const SizedBox(height: 20,),
            const CustomTextWidget(title: 'kindly check data connection or WiFi network',color: AppColors.appBarColor,fontSize: 14,)
          ],);
      },
    );
  }

}

