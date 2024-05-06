part of 'custom_keyboard_bloc.dart';

@immutable
class CustomKeyboardState {
  final TextEditingController textEditingController;
  final int length;
  CustomKeyboardState({required this.textEditingController, required this.length});
}

class CustomKeyboardInitial extends CustomKeyboardState {
  CustomKeyboardInitial({required super.textEditingController, required super.length});
}

class SetKeyboardLengthState extends CustomKeyboardState {
  SetKeyboardLengthState({required super.length, required super.textEditingController});
}
