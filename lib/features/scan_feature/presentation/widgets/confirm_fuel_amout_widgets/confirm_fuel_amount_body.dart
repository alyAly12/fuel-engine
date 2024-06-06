import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../core/component/custom_button.dart';
import '../../../../../core/component/custom_text_widget.dart';
import '../../../../../core/component/pick_image_function.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_dialog.dart';
import '../../../../../core/utils/app_route.dart';
import '../../../../../core/utils/app_strings.dart';

class ConfirmFuelAmountBody extends StatefulWidget {
  const ConfirmFuelAmountBody({super.key});

  @override
  State<ConfirmFuelAmountBody> createState() => _ConfirmFuelAmountBodyState();
}

class _ConfirmFuelAmountBodyState extends State<ConfirmFuelAmountBody> {
  XFile? _pickedImage;
  XFile? _pickedImage2;
  XFile? _pickedImage3;
  void removePickedImage() {
    setState(() {
      _pickedImage = null;
    });
  }

  void removePickedImage2() {
    setState(() {
      _pickedImage2 = null;
    });
  }

  void removePickedImage3() {
    setState(() {
      _pickedImage3 = null;
    });
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    _pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  Future<void> localImagePicker2() async {
    final ImagePicker picker = ImagePicker();
    _pickedImage2 = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  Future<void> localImagePicker3() async {
    final ImagePicker picker = ImagePicker();
    _pickedImage3 = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  Future<void> upLoadImage() async {
    if (_pickedImage == null || _pickedImage2 == null || _pickedImage3 == null) {
      DialogsServices.appDialog(context: context, title: 'Please select an image', fct: () {});
      return;
    } else {
      GoRouter.of(context).pushReplacement(AppRoute.kConfirmSuccessScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            AssetsManager.newRedRectangle,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          left: 130,
          top: 100,
          child: CustomTextWidget(
            title: '40 ${AppStrings.fuelAmount}',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Positioned.fill(
          top: 250,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PickImageFunction(
                        pickedImage: _pickedImage,
                        image: AssetsManager.odooLogo,
                        imagePickerFun: () {
                          localImagePicker();
                        },
                        removeTheImage: () {
                          removePickedImage();
                        },
                        file: _pickedImage?.path,
                        title: 'ODO Meter'),
                    PickImageFunction(
                        pickedImage: _pickedImage2,
                        image: AssetsManager.carLogo,
                        imagePickerFun: () {
                          localImagePicker2();
                        },
                        removeTheImage: () {
                          removePickedImage2();
                        },
                        file: _pickedImage2?.path,
                        title: 'Pump'),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              PickImageFunction(
                  pickedImage: _pickedImage3,
                  image: AssetsManager.gasLogo,
                  imagePickerFun: () {
                    localImagePicker3();
                  },
                  removeTheImage: () {
                    removePickedImage3();
                  },
                  file: _pickedImage3?.path,
                  title: 'Car'),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomLoginButton(
                    textColor: Colors.white,
                    buttonHeight: 55,
                    textSize: 15,
                    textWeight: FontWeight.w500,
                    onPressed: () {
                      upLoadImage();
                    },
                    color: (_pickedImage == null || _pickedImage2 == null || _pickedImage3 == null)
                        ? AppColors.orderNumberColor
                        : AppColors.confirmColor,
                    title: AppStrings.confirm2,
                    showIcon: false),
              )
            ],
          ),
        ),
      ],
    );
  }
}
