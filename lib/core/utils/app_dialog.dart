import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import '../component/custom_text_widget.dart';
import '../component/subtitle_text_widget.dart';

class DialogsServices {
  static Future<void> appDialog(
      {required BuildContext context,
      required String title,
      required Function fct,
      bool isError = true}) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: SizedBox(
              child: SvgPicture.asset(AssetsManager.danger),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            title: Center(
                child: CustomTextWidget(
              title: title,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              maxLines: 1,
            )),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: isError,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SubTitleWidget(
                              subTitle: 'Cancel',
                              color: Color(0xff545e69),
                              fontSize: 10,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  TextButton(
                      onPressed: () {
                        fct();
                        Navigator.pop(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8), color: AppColors.activeColor),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SubTitleWidget(
                              subTitle: 'Change',
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ))),
                  SizedBox(
                    width: 6,
                  ),
                ],
              )
            ],
          );
        });
  }

  static void connectionDialog(
      {required BuildContext context, required Function fct, bool isError = true}) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: CustomTextWidget(title: 'Kindly check connection tools'),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
            title: Column(
              children: [
                CustomTextWidget(
                  title: 'internet connection',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  maxLines: 1,
                  color: AppColors.appBarColor,
                ),
                CustomTextWidget(
                    title: 'NFC connection',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    color: AppColors.appBarColor),
                CustomTextWidget(
                    title: 'GPS location',
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    color: AppColors.appBarColor),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 3,
                  ),
                  Visibility(
                    visible: isError,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SubTitleWidget(
                              subTitle: 'Cancel',
                              color: Color(0xff545e69),
                              fontSize: 10,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  TextButton(
                      onPressed: () {
                        fct();
                        Navigator.pop(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8), color: AppColors.activeColor),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SubTitleWidget(
                              subTitle: 'Active connection',
                              color: AppColors.appBarColor,
                              fontSize: 10,
                            ),
                          ))),
                ],
              )
            ],
          );
        });
  }
}
