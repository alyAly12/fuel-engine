import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_device_id/platform_device_id.dart';
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
    String? deviceId0;
    var deviceId = await PlatformDeviceId.getDeviceId;
    deviceId0 = deviceId;
    emit(GetDeviceIdNumberState(deviceId0!));
    print(deviceId0);
    return deviceId0;
  }

  @override
  void onChange(Change<PairingState> change) {
    print(change);
    super.onChange(change);
  }
}
