import 'package:flutter/material.dart';
import 'package:fuelsystem/features/drawer_inner_screens/widgets/complaint_screen_widget/complaint_screen_body.dart';

import '../../core/component/custom_regular_appbar.dart';
import '../../core/utils/app_strings.dart';

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
            preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
            child: CustomRegularAppBar(
              mainTitle: AppStrings.complain,
              actionTitle: AppStrings.back,
            )),
        body: const SingleChildScrollView(reverse: true, child: ComplaintScreenBody()),
      ),
    );
  }
}
