import 'package:flutter/material.dart';

Future<void> pickTime({
  required TextEditingController controller,
  required BuildContext context,
}) async {
  TimeOfDay dateTime = TimeOfDay.now();
  FocusScope.of(context).requestFocus(FocusNode());
  TimeOfDay? picked = await showTimePicker(
      context: context, initialTime: dateTime, initialEntryMode: TimePickerEntryMode.dial);
  if (picked != null && picked != dateTime) {
    controller.text = picked.format(context).toString();
    dateTime = picked;
  } else {
    dateTime;
  }
}
