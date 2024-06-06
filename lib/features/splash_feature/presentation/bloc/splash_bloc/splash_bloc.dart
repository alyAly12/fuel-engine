import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/splash_response_model.dart';
import '../../../domain/entity/splash_response_entity.dart';
import '../../../domain/use_case/splash_usecase.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashUseCase splashUseCase;

  SplashBloc(this.splashUseCase) : super(SplashInitial()) {
    // on<SplashSettingEvent>((event, emit) async{
    //
    //
    //
    //   if(SplashEvent is SplashSettingEvent){
    //     emit(SplashLoadingState());
    //      final  fetchResponse = await splashUseCase.call(event.splashRequestEntity);
    //      fetchResponse.fold((l) => emit(SplashFailureState(l.message)),
    //              (r) => emit(SplashSuccessState(r)));
    //   }
    // });
    on<SplashSettingEvent>(_getDetails);
  }

  FutureOr<void> _getDetails(
      SplashSettingEvent event, Emitter<SplashState> emit) async {
    final result = await splashUseCase.call(event.model);
    result.fold((l) {
      emit(SplashFailureState(l.message));
    }, (r) => emit(SplashSuccessState(r)));
  }

  @override
  void onChange(Change<SplashState> change) {
    print(change);
    super.onChange(change);
  }
}
