import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/app_route.dart';

class CustomAppBarHeader extends StatelessWidget {
  const CustomAppBarHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      child: Row(
        children: [
          const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white70,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          SvgPicture.asset(
            AssetsManager.appLogoWhite,
            width: size.width * 0.30,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoute.kNotificationScreen);
                },
                child: SvgPicture.asset(
                  AssetsManager.notifications,
                  height: 22,
                )),
          )
        ],
      ),
    );
  }
}
