import 'package:flutter/material.dart';
import 'package:sayarah/core/component/custom_text_widget.dart';
import 'package:sayarah/core/utils/app_colors.dart';
import 'package:sayarah/core/utils/app_strings.dart';

class CustomVehiclePinCode extends StatefulWidget {
  const CustomVehiclePinCode({
    super.key,
    this.onEditingComplete,
  });
  final Function()? onEditingComplete;

  @override
  State<CustomVehiclePinCode> createState() => _CustomVehiclePinCodeState();
}

class _CustomVehiclePinCodeState extends State<CustomVehiclePinCode> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;

  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            title: AppStrings.enterVehiclePIN,
            fontSize: 15,
            color: AppColors.orderNumberColor,
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PinNumberTextFieldBox(
                  first: true,
                  last: false,
                  controller: controller1,
                  onSubmitted: (value) {
                    controller1.text == value;
                  },
                ),
                PinNumberTextFieldBox(
                  first: false,
                  last: false,
                  controller: controller2,
                  onSubmitted: (value) {
                    controller2.text == value;
                  },
                ),
                PinNumberTextFieldBox(
                  first: false,
                  last: false,
                  controller: controller3,
                  onSubmitted: (value) {
                    controller3.text == value;
                  },
                ),
                PinNumberTextFieldBox(
                  first: false,
                  last: true,
                  controller: controller4,
                  onSubmitted: (value) {
                    controller4 == value;
                  },
                  onEditingComplete: widget.onEditingComplete,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PinNumberTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final Function()? onEditingComplete;
  PinNumberTextFieldBox({
    super.key,
    required this.first,
    required this.last,
    this.controller,
    this.onSubmitted,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          controller: controller,
          onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.greyColor),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(0),
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: AppColors.orderNumberColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: AppColors.orderNumberColor),
                borderRadius: BorderRadius.circular(10)),
            hintText: '0',
            hintStyle:
                TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.greyColor),
          ),
        ),
      ),
    );
  }
}
