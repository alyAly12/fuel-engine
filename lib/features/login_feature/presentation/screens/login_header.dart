import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: CircleAvatar(
            radius: 30.5,
            child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(AssetsManager.sascoLogo)),
          ),
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        SubTitleWidget(
          subTitle: AppStrings.chillOut,
          color: AppColors.greyColor,
          fontWeight: FontWeight.normal,
          fontSize: 25,
        )
      ],
    );
  }
}
