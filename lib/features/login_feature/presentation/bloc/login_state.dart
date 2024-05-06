part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginResponseEntity login;

  LoginSuccessState(this.login);
}

class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
}
