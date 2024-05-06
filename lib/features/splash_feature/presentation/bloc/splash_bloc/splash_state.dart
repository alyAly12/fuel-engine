part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashSuccessState extends SplashState {
  final SplashResponseEntity splashResponseEntity;
  SplashSuccessState(this.splashResponseEntity);
}

class SplashFailureState extends SplashState {
  final String errorMessage;
  SplashFailureState(this.errorMessage);
}
