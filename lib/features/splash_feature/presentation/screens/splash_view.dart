import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/models/splash_response_model.dart';
import '../../domain/use_case/splash_usecase.dart';
import '../bloc/splash_bloc/splash_bloc.dart';
import '../widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashResponseModel model = SplashResponseModel();
    return BlocProvider(
      create: (context) => SplashBloc(sl<SplashUseCase>())..add(SplashSettingEvent(model)),
      child: const Scaffold(
        body: SplashBody(),
      ),
    );
  }
}
