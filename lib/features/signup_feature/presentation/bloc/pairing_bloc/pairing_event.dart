part of 'pairing_bloc.dart';

@immutable
abstract class PairingEvent {}

class PairingUserEvent extends PairingEvent {
  final PairingRequestEntity pairingRequestEntity;
  PairingUserEvent({required this.pairingRequestEntity});
}

class GetDeviceIdNumberEvent extends PairingEvent
{
  final String? deviceId;

  GetDeviceIdNumberEvent(this.deviceId);
}
