import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/component/custom_text_widget.dart';
import '../../../../core/utils/app_colors.dart';


Future<void>showQrCodeWidget(BuildContext context, {required String data})async{
  showDialog(
      barrierColor: Colors.white70,
      context: context,
      builder: (context){
        return  Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextWidget(title: 'Scan QR',fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.blackCoat,),
              const SizedBox(height: 50,),
              QrImageView(
                data: data,
                version: QrVersions.auto,
                size: 150.0,
              ),
            ],
        );
      });
}
