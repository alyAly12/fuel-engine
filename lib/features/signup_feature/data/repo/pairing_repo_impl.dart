import 'package:dartz/dartz.dart';
import 'package:sayarah/core/exceptions/failure.dart';
import 'package:sayarah/core/utils/errors/exceptions.dart';
import '../../domain/entities/pairing_request_entity.dart';
import '../../domain/entities/pairing_response_entity.dart';
import '../../domain/repository/pairing_repository.dart';
import '../data_source/pairing_data_source.dart';

class PairingRepoImpl implements PairingRepository {
  final PairingDataSource _dataSource;

  PairingRepoImpl({required PairingDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<Failure, PairingResponseEntity>> pair(
      PairingRequestEntity pairingRequestEntity) async {
    try {
      final redirectUrl = await _dataSource.pairing(pairingRequestEntity);
      return Right(redirectUrl);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.message));
    }
  }
}
