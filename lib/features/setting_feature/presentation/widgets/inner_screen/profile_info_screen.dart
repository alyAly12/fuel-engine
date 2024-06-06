import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/component/custom_drawer.dart';
import '../../../../../core/component/custom_regular_appbar.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';


class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.profileInformation,
            actionTitle: AppStrings.back,
          )),
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(color: AppColors.orderNumberColor),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Row(
                  children: [
                    const Column(
                      children: [
                        CustomTextWidget(
                          title: 'Ahmed Ali',
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 15,
                              color: Colors.white,
                            ),
                            CustomTextWidget(
                              title: '09542111112',
                              color: Colors.white,
                              fontSize: 15,
                            )
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        const CustomTextWidget(
                          title: '2 may 2013 12:40 PM',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 110,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              color: AppColors.pieChartColor,
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: CustomTextWidget(
                              title: AppStrings.active,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomTextWidget(
              title: 'ChillOut',
              fontSize: 17,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
        Positioned(
          top: 150,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(AssetsManager.sascoLogo),
            ),
          ),
        )
      ]),
    );
  }
}
