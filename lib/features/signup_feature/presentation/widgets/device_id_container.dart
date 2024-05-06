import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';


class DeviceIdContainer extends StatelessWidget {
  const DeviceIdContainer({
    super.key,
    required this.deviceId,
    this.onTap,
  });

  final String deviceId;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 12),
        decoration: BoxDecoration(
            color: AppColors.deviceIdColor,
            border: Border.all(
              color: AppColors.deviceIdColor,
            ),
            shape: BoxShape.rectangle),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            QrImageView(
              data: deviceId,
              version: QrVersions.auto,
              size: 50.0,
            ),
            CustomTextWidget(
              title: AppStrings.kDeviceId,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            CustomTextWidget(
              title: deviceId,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.idNumColor,
            )
          ],
        ),
      ),
    );
  }
}
