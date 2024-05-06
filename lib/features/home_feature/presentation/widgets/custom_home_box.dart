import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import 'package:sayarah/features/login_feature/presentation/screens/custom_home_logo_box.dart';

import '../../../../../core/commom_bloc/theme_cubit/theme_cubit.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/component/subtitle_text_widget.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomHomeBox extends StatelessWidget {
  const CustomHomeBox({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 0.1),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: size.width,
          decoration: BoxDecoration(
              color: theme.isDark ? AppColors.darkGrey : AppColors.homeBox,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.pieChartColor,
                    child: SvgPicture.asset(
                      AssetsManager.pieChartImage,
                      height: 24,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubTitleWidget(
                        subTitle: AppStrings.todayOrder,
                        fontSize: 15,
                        color: AppColors.welcomeScript,
                        fontWeight: FontWeight.normal,
                      ),
                      CustomTextWidget(
                        title: '203',
                        color: AppColors.pieChartColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  const CustomHomeBoxLogo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
