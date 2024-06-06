import 'package:dartz/dartz.dart';


import '../../../../core/base_use_cases/base_use_case.dart';
import '../../../../core/exceptions/failure.dart';
import '../entity/splash_response_entity.dart';
import '../repository/splash_repositiory.dart';

class SplashUseCase implements UseCase<SplashResponseEntity, SplashResponseEntity> {
  final SplashRepository splashRepository;
  SplashUseCase(this.splashRepository);

  @override
  Future<Either<Failure, SplashResponseEntity>> call(
      SplashResponseEntity splashResponseEntity) async {
    return await splashRepository.splashSettings(splashResponseEntity);
  }
}
