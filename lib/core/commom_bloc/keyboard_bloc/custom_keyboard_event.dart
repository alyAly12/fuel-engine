part of 'custom_keyboard_bloc.dart';

@immutable
abstract class CustomKeyboardEvent {}

class SetKeyboardLengthEvent extends CustomKeyboardEvent {
  final TextEditingController textEditingController;
  final int length;

  SetKeyboardLengthEvent({required this.textEditingController, required this.length});
}
