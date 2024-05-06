part of 'connection_check_bloc.dart';

@immutable
abstract class ConnectionCheckEvent {}

class ConnectedEvent extends ConnectionCheckEvent {}

class NotConnectedEvent extends ConnectionCheckEvent {}

class CheckLocationEvent extends ConnectionCheckEvent {}

class LocationChangedEvent extends ConnectionCheckEvent {}

class LocationNotChangedEvent extends ConnectionCheckEvent {}

class NfcCheckEvent extends ConnectionCheckEvent {}
class ChangeDialogVisibilityEvent extends ConnectionCheckEvent {
  final bool isVisible;
  ChangeDialogVisibilityEvent({required this.isVisible});
}
