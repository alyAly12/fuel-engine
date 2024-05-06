import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_regular_appbar.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/features/drawer_inner_screens/widgets/complaint_screen_widget/complaint_screen_body.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
            child: CustomRegularAppBar(
              mainTitle: AppStrings.complain,
              actionTitle: AppStrings.back,
            )),
        body: SingleChildScrollView(reverse: true, child: ComplaintScreenBody()),
      ),
    );
  }
}
