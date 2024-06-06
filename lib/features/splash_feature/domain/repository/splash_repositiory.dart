import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../entity/splash_response_entity.dart';

abstract class SplashRepository {
  Future<Either<Failure, SplashResponseEntity>> splashSettings(
      SplashResponseEntity splashRequestEntity);
}
