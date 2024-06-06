import 'package:flutter/material.dart';

import '../widgets/start_fuel_vehicle_widgets/start_fuel_vehicle_body.dart';

class StartFuelVehicle extends StatelessWidget {
  const StartFuelVehicle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StartFuelVehicleBody(),
    );
  }
}
