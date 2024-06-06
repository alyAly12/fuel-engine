import 'package:dartz/dartz.dart';

import '../../../../core/base_use_cases/base_use_case.dart';
import '../../../../core/exceptions/failure.dart';
import '../entities/login_request_entity.dart';
import '../entities/login_response_entity.dart';
import '../repositories/login_repository.dart';


class LoginUseCase implements UseCase<LoginResponseEntity, LoginRequestEntity> {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(LoginRequestEntity params) async {
    return await repository.login(params);
  }
}
