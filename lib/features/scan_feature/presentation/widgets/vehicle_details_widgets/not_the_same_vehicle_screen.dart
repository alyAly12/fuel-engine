import 'package:flutter/material.dart';
import 'package:fuelsystem/features/scan_feature/presentation/widgets/vehicle_details_widgets/vehicle_details_plate_container.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../../core/component/custom_keyboard.dart';
import '../../../../../../core/component/custom_regular_appbar.dart';
import '../../../../../../core/component/custom_text_widget.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/auth_validator.dart';
import '../../../../../core/component/custom_button.dart';
import '../../../../../core/component/pick_image_function.dart';
import '../report_issue_widgets/custom_decorated_text_line.dart';
import 'custom_vehicle_detail_card.dart';

class NotTheSameVehicleScreen extends StatefulWidget {
  const NotTheSameVehicleScreen({super.key});

  @override
  State<NotTheSameVehicleScreen> createState() => _NotTheSameVehicleScreenState();
}

class _NotTheSameVehicleScreenState extends State<NotTheSameVehicleScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController vehicleNumber;

  late TextEditingController vehicleLetter;
  late FocusNode numberNode;
  late FocusNode letterNode;

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

  void _onFocusChange() {
    setState(() {});
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

  XFile? _pickedImage;

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    _pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void removePickedImage() {
    setState(() {
      _pickedImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size(kBottomNavigationBarHeight, kBottomNavigationBarHeight),
            child: CustomRegularAppBar(
              mainTitle: AppStrings.vehicleDetails,
              actionTitle: AppStrings.cancel,
            )),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: CustomVehicleDetailCard(),
              ),
              const SizedBox(
                height: 30,
              ),
              PickImageFunction(
                pickedImage: _pickedImage,
                image: AssetsManager.darkCar,
                imagePickerFun: () {
                  localImagePicker();
                },
                removeTheImage: () {
                  removePickedImage();
                },
                file: _pickedImage?.path,
                title: AppStrings.vehicleImage,
                titleColor: AppColors.orderNumberColor,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextWidget(
                title: AppStrings.enterVehicleNumber,
                fontSize: 15,
                color: AppColors.darkGrey,
                fontWeight: FontWeight.w200,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: VehicleDetailsPlateContainer(
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
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 6,
                    child: CustomDecoratedTextLine(title: AppStrings.number),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    flex: 5,
                    child: CustomDecoratedTextLine(title: AppStrings.letters),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomLoginButton(
                    textWeight: FontWeight.w500,
                    textSize: 15,
                    buttonHeight: 55,
                    onPressed: () {},
                    color: AppColors.redColor,
                    title: AppStrings.report,
                    showIcon: false),
              ),
              letterNode.hasFocus
                  ? CustomKeyBoard(controller: vehicleLetter, focusNode: letterNode)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
