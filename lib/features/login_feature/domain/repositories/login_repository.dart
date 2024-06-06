import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/failure.dart';
import '../entities/login_request_entity.dart';
import '../entities/login_response_entity.dart';



abstract class LoginRepository {
  Future<Either<Failure, LoginResponseEntity>> login(LoginRequestEntity loginRequestEntity);
}
