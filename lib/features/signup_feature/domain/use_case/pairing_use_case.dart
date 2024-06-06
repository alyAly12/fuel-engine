import 'package:dartz/dartz.dart';
import '../../../../core/base_use_cases/base_use_case.dart';
import '../../../../core/exceptions/failure.dart';
import '../entities/pairing_request_entity.dart';
import '../entities/pairing_response_entity.dart';
import '../repository/pairing_repository.dart';

class PairingUseCase implements UseCase<PairingResponseEntity, PairingRequestEntity> {
  final PairingRepository repository;

  PairingUseCase(this.repository);

  @override
  Future<Either<Failure, PairingResponseEntity>> call(PairingRequestEntity params) async {
    return await repository.pair(params);
  }
}
