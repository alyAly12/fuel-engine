import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../entities/pairing_request_entity.dart';
import '../entities/pairing_response_entity.dart';

abstract class PairingRepository {
  Future<Either<Failure, PairingResponseEntity>> pair(PairingRequestEntity pairingRequestEntity);
}
