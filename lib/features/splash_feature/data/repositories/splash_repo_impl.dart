import 'package:dartz/dartz.dart';
import 'package:sayarah/core/exceptions/failure.dart';
import 'package:sayarah/core/exceptions/server_exceptions.dart';
import 'package:sayarah/features/splash_feature/data/data_source/remote_data_source/splash_remote_data_source.dart';
import 'package:sayarah/features/splash_feature/domain/entity/splash_response_entity.dart';
import 'package:sayarah/features/splash_feature/domain/repository/splash_repositiory.dart';


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
      return left(ServerFailure('error'));
    }
  }
}
