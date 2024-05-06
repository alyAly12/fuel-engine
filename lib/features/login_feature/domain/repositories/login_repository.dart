import 'package:dartz/dartz.dart';
import 'package:sayarah/core/exceptions/failure.dart';
import 'package:sayarah/features/login_feature/domain/entities/login_request_entity.dart';
import 'package:sayarah/features/login_feature/domain/entities/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseEntity>> login(LoginRequestEntity loginRequestEntity);
}
