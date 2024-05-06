import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayarah/features/splash_feature/data/models/splash_response_model.dart';
import 'package:sayarah/features/splash_feature/domain/use_case/splash_usecase.dart';
import 'package:sayarah/features/splash_feature/presentation/bloc/splash_bloc/splash_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashResponseModel model = SplashResponseModel();
    return BlocProvider(
      create: (context) => SplashBloc(sl<SplashUseCase>())..add(SplashSettingEvent(model)),
      child: Scaffold(
        body: SplashBody(),
      ),
    );
  }
}
