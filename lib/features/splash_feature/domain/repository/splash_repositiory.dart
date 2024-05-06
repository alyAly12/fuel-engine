import 'package:dartz/dartz.dart';
import 'package:sayarah/features/splash_feature/domain/entity/splash_response_entity.dart';
import '../../../../core/exceptions/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, SplashResponseEntity>> splashSettings(
      SplashResponseEntity splashRequestEntity);
}
