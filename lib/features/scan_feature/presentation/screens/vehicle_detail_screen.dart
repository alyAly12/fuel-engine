import 'package:flutter/material.dart';

import '../../../../core/component/custom_regular_appbar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/vehicle_details_widgets/vehicle_details_body.dart';

class VehicleDetailsScreen extends StatelessWidget {
  const VehicleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
          preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
          child: CustomRegularAppBar(
            mainTitle: AppStrings.vehicleId,
            actionTitle: AppStrings.cancel,
          )),
      body: const VehicleDetailsBody(),
    );
  }
}
