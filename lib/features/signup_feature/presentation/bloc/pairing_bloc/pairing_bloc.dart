import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:platform_device_id_v3/platform_device_id.dart';
import '../../../domain/entities/pairing_request_entity.dart';
import '../../../domain/entities/pairing_response_entity.dart';
import '../../../domain/use_case/pairing_use_case.dart';

part 'pairing_event.dart';

part 'pairing_state.dart';

class PairingBloc extends Bloc<PairingEvent, PairingState> {
  PairingUseCase? useCase;

  PairingBloc({this.useCase}) : super(PairingInitial()) {
    on<PairingUserEvent>(_pair);
    on<GetDeviceIdNumberEvent>(_redeemingId);
  }

  Future<FutureOr<void>> _pair(
      PairingUserEvent event, Emitter<PairingState> emit) async {
    final pairingListEither = await useCase!.call(event.pairingRequestEntity);
    pairingListEither.fold(
        (l) =>
            {emit(PairingFailureState(l.message)), print('left ${l.message}')},
        (r) => {emit(PairingSuccessState(r))});
  }

  Future<FutureOr<void>> _redeemingId(
      GetDeviceIdNumberEvent event, Emitter<PairingState> emit) async {
    String? _deviceId;
    var deviceId = await PlatformDeviceId.getDeviceId;
    _deviceId = deviceId;
    emit(GetDeviceIdNumberState(_deviceId!));
    print(_deviceId);
    return _deviceId;
  }

  @override
  void onChange(Change<PairingState> change) {
    print(change);
    super.onChange(change);
  }
}
