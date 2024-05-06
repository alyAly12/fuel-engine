part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUserEvent extends LoginEvent {
  final LoginRequestEntity loginRequestEntity;

  LoginUserEvent({required this.loginRequestEntity});
}
