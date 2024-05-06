import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';
import 'package:sayarah/core/utils/assets_manager.dart';
import 'package:sayarah/core/component/custom_button.dart';
import '../../../../../../core/component/custom_keyboard.dart';
import '../../../../../../core/component/pick_image_function.dart';
import '../../../../../../core/utils/app_dialog.dart';
import '../../../../../../core/utils/app_route.dart';
import '../../../../../../core/utils/auth_validator.dart';
import '../report_issue_widgets/custom_decorated_text_line.dart';
import '../vehicle_details_widgets/vehicle_details_plate_container.dart';

class VehicleRegistrationBody extends StatefulWidget {
  const VehicleRegistrationBody({super.key});

  @override
  State<VehicleRegistrationBody> createState() => _VehicleRegistrationBodyState();
}

class _VehicleRegistrationBodyState extends State<VehicleRegistrationBody> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController vehicleNumber;
  late TextEditingController vehicleLetter;
  late FocusNode numberNode;
  late FocusNode letterNode;
  XFile? _pickedImage;
  XFile? _pickedImage2;

  @override
  void initState() {
    vehicleNumber = TextEditingController();
    vehicleLetter = TextEditingController();
    numberNode = FocusNode();
    letterNode = FocusNode();
    letterNode.addListener(() {
      _onFocusChange();
    });
    super.initState();
  }

  @override
  void dispose() {
    vehicleLetter.dispose();
    vehicleNumber.dispose();
    numberNode.dispose();
    letterNode
      ..removeListener(() {
        _onFocusChange();
      })
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

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

  Future<void> upLoadImage() async {
    final _isValid = formKey.currentState!.validate();
    if (_isValid && _pickedImage != null && _pickedImage2 != null) {
      GoRouter.of(context).pushReplacement(AppRoute.kSuccessRegisterScreen);
    }
    if (_pickedImage == null || _pickedImage2 == null) {
      DialogsServices.appDialog(context: context, title: 'Please select an image', fct: () {});
      return;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(AssetsManager.danger),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CustomTextWidget(
                fontWeight: FontWeight.w500,
                title: AppStrings.unKnowVehicle,
                fontSize: 17,
                color: AppColors.appBarColor,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CustomTextWidget(
                title: AppStrings.unKnownMessage,
                fontSize: 15,
                color: AppColors.lightTitleColor,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CustomTextWidget(
                title: AppStrings.unKnownMessage2,
                fontSize: 15,
                color: AppColors.lightTitleColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextWidget(
              title: AppStrings.vehicleNumber,
              color: AppColors.darkGrey,
              fontSize: 15,
            ),
            SizedBox(
              height: 15,
            ),
            VehicleDetailsPlateContainer(
              keyForm: formKey,
              carNum: vehicleNumber,
              carLetter: vehicleLetter,
              letterNode: letterNode,
              numberNode: numberNode,
              validatorNum: (value) {
                return AuthValidator.vehicleNumberValidator(value);
              },
              validatorLetter: (value) {
                return AuthValidator.vehicleLetterValidator(value);
              },
              onLetterFieldSubmitted: (value) {
                vehicleLetter.text == value;
              },
              onNumberFieldSubmitted: (value) {
                vehicleNumber.text == value;
              },
            ),
            SizedBox(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 5,
                  child: CustomDecoratedTextLine(title: AppStrings.number),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 5,
                  child: CustomDecoratedTextLine(title: AppStrings.letters),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PickImageFunction(
                    pickedImage: _pickedImage,
                    image: AssetsManager.cameraLogo,
                    imagePickerFun: () {
                      localImagePicker();
                    },
                    removeTheImage: () {
                      removePickedImage();
                    },
                    file: _pickedImage?.path,
                    title: 'Plate',
                    titleColor: AppColors.lightTitleColor,
                  ),
                  PickImageFunction(
                    pickedImage: _pickedImage2,
                    image: AssetsManager.darkCar,
                    imagePickerFun: () {
                      localImagePicker2();
                    },
                    removeTheImage: () {
                      removePickedImage2();
                    },
                    file: _pickedImage2?.path,
                    title: 'Vehicle',
                    titleColor: AppColors.lightTitleColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1),
              child: CustomLoginButton(
                  textColor: Colors.white,
                  buttonHeight: 55,
                  textSize: 14,
                  textWeight: FontWeight.w500,
                  onPressed: () {
                    upLoadImage();
                  },
                  color: (_pickedImage == null && _pickedImage2 == null)
                      ? AppColors.orderNumberColor
                      : AppColors.redColor,
                  title: AppStrings.register,
                  showIcon: true),
            ),
            letterNode.hasFocus
                ? CustomKeyBoard(controller: vehicleLetter, focusNode: letterNode)
                : Container(),
          ],
        ),
      ),
    );
  }
}
