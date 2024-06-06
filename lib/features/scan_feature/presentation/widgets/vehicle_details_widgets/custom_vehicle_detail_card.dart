import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import 'custom_details_column.dart';

class CustomVehicleDetailCard extends StatelessWidget {
  const CustomVehicleDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.homeBox,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey.shade300, blurRadius: 15.0, offset: const Offset(0.0, 0.75))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue,
                        border: Border.all(color: Colors.grey)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomDetailColumn(title: AppStrings.vehicleNumber, subTitle: '7403 RUA'),
                  const SizedBox(
                    width: 50,
                  ),
                  CustomDetailColumn(title: AppStrings.vehicleType, subTitle: 'Skoda'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Divider(
                thickness: 0.6,
                color: AppColors.orderNumberColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomDetailColumn(
                    title: AppStrings.maxAllowed,
                    subTitle: '40 LTR',
                    titleColor: AppColors.redColor,
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  CustomDetailColumn(title: AppStrings.fuelType, subTitle: AppStrings.gas95),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
