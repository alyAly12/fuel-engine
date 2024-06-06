import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../../core/utils/errors/exceptions.dart';
import '../../domain/entities/login_request_entity.dart';
import '../../domain/entities/login_response_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_source/login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _remoteDataSource;

  LoginRepositoryImpl({
    required LoginDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, LoginResponseEntity>> login(LoginRequestEntity loginRequestEntity) async {
    try {
      final redirectUrl = await _remoteDataSource.login(loginRequestEntity);
      return Right(redirectUrl);
    } on ServerException {
      return const Left(
        ServerFailure("error"),
      );
    }
  }
}
