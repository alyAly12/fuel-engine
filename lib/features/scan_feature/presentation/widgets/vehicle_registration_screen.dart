import 'package:flutter/material.dart';
import 'package:fuelsystem/features/scan_feature/presentation/widgets/vehicle_registration_widgets/vehicle_registration_body.dart';
import '../../../../../core/component/custom_drawer.dart';
import '../../../../../core/component/custom_regular_appbar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class VehicleRegistrationScreen extends StatelessWidget {
  const VehicleRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        drawer: const CustomDrawer(),
        backgroundColor: AppColors.backGroundColor,
        appBar: PreferredSize(
            preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight + 10),
            child: CustomRegularAppBar(
              mainTitle: AppStrings.vehicleRegistration,
              actionTitle: AppStrings.back,
            )),
        body: const VehicleRegistrationBody(),
      ),
    );
  }
}
