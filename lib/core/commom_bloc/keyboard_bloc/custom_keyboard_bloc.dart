import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custom_keyboard_event.dart';

part 'custom_keyboard_state.dart';

class CustomKeyboardBloc extends Bloc<CustomKeyboardEvent, CustomKeyboardState> {
  CustomKeyboardBloc()
      : super(CustomKeyboardInitial(textEditingController: TextEditingController(), length: 3)) {
    on<CustomKeyboardEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SetKeyboardLengthEvent>(_setLength);
  }

  FutureOr<void> _setLength(SetKeyboardLengthEvent event, Emitter<CustomKeyboardState> emit) {
    emit(SetKeyboardLengthState(
        length: event.length, textEditingController: event.textEditingController));
  }
}
