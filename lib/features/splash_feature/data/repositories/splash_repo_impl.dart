import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../../core/exceptions/server_exceptions.dart';
import '../../domain/entity/splash_response_entity.dart';
import '../../domain/repository/splash_repositiory.dart';
import '../data_source/remote_data_source/splash_remote_data_source.dart';



class SplashRepoImpl implements SplashRepository {
  final SplashRemoteDataSource splashRemoteDataSource;


  SplashRepoImpl(this.splashRemoteDataSource);

  @override
  Future<Either<Failure, SplashResponseEntity>> splashSettings(
      SplashResponseEntity splashResponseEntity) async {
    try {
      final reqUrl = await splashRemoteDataSource.setting(splashResponseEntity);
      return right(reqUrl);
    } on ServerExceptions {
      return left(const ServerFailure('error'));
    }
  }
}
