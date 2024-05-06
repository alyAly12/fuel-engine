import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_drawer.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import '../../../../../../core/component/custom_regular_appbar.dart';
import '../../../../../../core/utils/app_strings.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.termsAndConditions,
            actionTitle: AppStrings.back,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: AppStrings.termsAndConditions,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.appBarColor,
            ),
            SizedBox(
              height: 40,
            ),
            CustomTextWidget(
              title:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
              maxLines: 9,
              fontSize: 13,
            )
          ],
        ),
      ),
    );
  }
}
