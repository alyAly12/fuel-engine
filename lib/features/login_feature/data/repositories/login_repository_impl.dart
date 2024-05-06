import 'package:dartz/dartz.dart';
import 'package:sayarah/core/utils/errors/exceptions.dart';
import 'package:sayarah/core/exceptions/failure.dart';
import 'package:sayarah/features/login_feature/data/data_source/login_data_source.dart';
import 'package:sayarah/features/login_feature/domain/entities/login_request_entity.dart';
import 'package:sayarah/features/login_feature/domain/entities/login_response_entity.dart';
import 'package:sayarah/features/login_feature/domain/repositories/login_repository.dart';

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
