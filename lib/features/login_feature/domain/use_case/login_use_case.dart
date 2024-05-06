import 'package:dartz/dartz.dart';
import 'package:sayarah/core/base_use_cases/base_use_case.dart';
import 'package:sayarah/core/exceptions/failure.dart';
import 'package:sayarah/features/login_feature/domain/entities/login_request_entity.dart';
import 'package:sayarah/features/login_feature/domain/entities/login_response_entity.dart';
import 'package:sayarah/features/login_feature/domain/repositories/login_repository.dart';

class LoginUseCase implements UseCase<LoginResponseEntity, LoginRequestEntity> {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(LoginRequestEntity params) async {
    return await repository.login(params);
  }
}
