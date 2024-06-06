import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/login_request_entity.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/use_case/login_use_case.dart';


part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase? loginUseCase;

  LoginBloc({this.loginUseCase}) : super(LoginInitial()) {
    on<LoginUserEvent>(_login);
  }

  Future<FutureOr<void>> _login(LoginUserEvent event, Emitter<LoginState> emit) async {
    final accountsListEither = await loginUseCase!.call(event.loginRequestEntity);

    accountsListEither.fold(
      (l) => {emit(LoginFailureState(l.message)), print('left ${l.message}')},
      (res) {
        emit(LoginSuccessState(res));
        print('right ${res.message}');
      },
    );
  }
}
