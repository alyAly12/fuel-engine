import 'package:dartz/dartz.dart';
import 'package:sayarah/core/base_use_cases/base_use_case.dart';
import 'package:sayarah/core/exceptions/failure.dart';
import 'package:sayarah/features/splash_feature/domain/entity/splash_response_entity.dart';
import 'package:sayarah/features/splash_feature/domain/repository/splash_repositiory.dart';

class SplashUseCase implements UseCase<SplashResponseEntity, SplashResponseEntity> {
  final SplashRepository splashRepository;
  SplashUseCase(this.splashRepository);

  @override
  Future<Either<Failure, SplashResponseEntity>> call(
      SplashResponseEntity splashResponseEntity) async {
    return await splashRepository.splashSettings(splashResponseEntity);
  }
}
