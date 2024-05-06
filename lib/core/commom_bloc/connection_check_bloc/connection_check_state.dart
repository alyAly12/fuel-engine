part of 'connection_check_bloc.dart';

@immutable
abstract class ConnectionCheckState {
  final bool isDialogShown;
  ConnectionCheckState({required this.isDialogShown});
}

class ConnectionCheckInitial extends ConnectionCheckState {
  ConnectionCheckInitial({required super.isDialogShown});
}

class ConnectedState extends ConnectionCheckState {
  final String message;
  final Color color;
  final IconData icon;

  ConnectedState({required this.color, required this.icon, required this.message,required super.isDialogShown});
}

class NotConnectedState extends ConnectionCheckState {
  final String message;
  final Color color;
  final IconData icon;
  NotConnectedState(this.color, this.icon, {required this.message,required super.isDialogShown});
}

class LocationConnectedState extends ConnectionCheckState {
  final String message;
  final Color color;
  final IconData icon;

  LocationConnectedState({required this.color, required this.icon, required this.message,required super.isDialogShown});
}

class LocationNotConnectedState extends ConnectionCheckState {
  final String message;
  final Color color;
  final IconData icon;
  LocationNotConnectedState(this.color, this.icon, {required this.message,required super.isDialogShown});
}

class NfcAvailabilityState extends ConnectionCheckState {
  final bool isAvailable;
  final String message;
  final Color color;
  final IconData icon;
  NfcAvailabilityState(
      {required this.isAvailable, required this.message, required this.color, required this.icon,required super.isDialogShown});
}

class NfcNotAvailabilityState extends ConnectionCheckState {
  final bool isAvailable;
  final String message;
  final Color color;
  final IconData icon;
  NfcNotAvailabilityState(
      {required this.isAvailable, required this.message, required this.color, required this.icon,required super.isDialogShown});
}
class ChangeDialogVisibilityState extends ConnectionCheckState {

  ChangeDialogVisibilityState(
      {required super.isDialogShown});
}


