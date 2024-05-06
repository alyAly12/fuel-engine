part of 'pairing_bloc.dart';

@immutable
abstract class PairingState {}

class PairingInitial extends PairingState {}

class PairingLoadingState extends PairingState {}

class PairingSuccessState extends PairingState {
  final PairingResponseEntity pairing;

  PairingSuccessState(this.pairing);
}

class PairingFailureState extends PairingState {
  final String errorMessage;
  PairingFailureState(this.errorMessage);
}
class GetDeviceIdNumberState extends PairingState
{
  final String deviceId;

  GetDeviceIdNumberState(this.deviceId);
}

