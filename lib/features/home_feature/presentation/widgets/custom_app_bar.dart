import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/component/subtitle_text_widget.dart';
import '../../../../core/utils/assets_manager.dart';
import 'custom_app_bar_header.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(AssetsManager.newRedRectangle), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              bottom: 3,
              child: SvgPicture.asset(
                AssetsManager.redDots,
                fit: BoxFit.cover,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0.3),
                child: CustomAppBarHeader(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SubTitleWidget(
                      subTitle: 'Welcome'.tr(),
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const CustomTextWidget(
                      title: 'Ahmed Ali',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
