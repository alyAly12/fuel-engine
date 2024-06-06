import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/component/custom_regular_appbar.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_route.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/auth_validator.dart';
import '../../../../../core/component/custom_button.dart';
import '../../../../../core/component/custom_drawer.dart';
import '../../../../../core/utils/assets_manager.dart';
import 'custom_meter_container.dart';
import 'custom_vehicle_detail_card.dart';
import 'custom_vehicle_pin_code.dart';

class TheSameVehicleScreen extends StatefulWidget {
  const TheSameVehicleScreen({super.key});

  @override
  State<TheSameVehicleScreen> createState() => _TheSameVehicleScreenState();
}

class _TheSameVehicleScreenState extends State<TheSameVehicleScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController fuelController;
  late TextEditingController odooController;
  late FocusNode fuelNode;
  late FocusNode odooNode;
  @override
  void initState() {
    fuelController = TextEditingController();
    odooController = TextEditingController();
    fuelNode = FocusNode();
    odooNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    fuelController.dispose();
    odooController.dispose();
    super.dispose();
  }

  Future<void> submitVehicle() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return CustomVehiclePinCode(
              onEditingComplete: () {
                GoRouter.of(context).pushReplacement(AppRoute.kStartFuelVehicle);
              },
            );
          });
    }
  }

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
              mainTitle: AppStrings.vehicleDetails,
              actionTitle: AppStrings.cancel,
            )),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const CustomVehicleDetailCard(),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomTextWidget(
                      title: AppStrings.requestedFuel,
                      color: AppColors.darkGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomMeterContainer(
                  keyBoardType: TextInputType.number,
                  validator: (value) {
                    return AuthValidator.fuelMeterValidator(value);
                  },
                  maxLength: 3,
                  node: fuelNode,
                  controller: fuelController,
                  onFieldSubmitted: (value) {
                    fuelController == value;
                  },
                  image: AssetsManager.gasoline,
                ),
                const SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomTextWidget(
                      title: AppStrings.odoMeter,
                      color: AppColors.darkGrey,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                CustomMeterContainer(
                  keyBoardType: TextInputType.number,
                  maxLength: 6,
                  validator: (value) {
                    return AuthValidator.odooMeterValidator(value);
                  },
                  node: odooNode,
                  controller: odooController,
                  onFieldSubmitted: (value) {
                    fuelController == value;
                  },
                  image: AssetsManager.odMeter,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CustomLoginButton(
                      buttonHeight: 60,
                      textSize: 15,
                      textWeight: FontWeight.w500,
                      onPressed: () {
                        submitVehicle();
                      },
                      color: (fuelController.text.isEmpty && fuelController.text.isEmpty ||
                              odooController.text.isEmpty && odooController.text.length < 3)
                          ? AppColors.orderNumberColor
                          : AppColors.redColor,
                      title: AppStrings.confirm,
                      showIcon: false),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
