import 'dart:convert';

import 'package:sayarah/core/services/network_service.dart';
import 'package:sayarah/core/utils/endpoints.dart';
import 'package:sayarah/core/utils/errors/exceptions.dart';
import 'package:sayarah/features/login_feature/data/models/login_response_model.dart';
import 'package:sayarah/features/login_feature/domain/entities/login_request_entity.dart';

abstract class LoginDataSource {
  Future<LoginResponseModel> login(LoginRequestEntity loginRequestEntity);
}

class LoginDataSourceImpl implements LoginDataSource {
  final NetworkService _service;
  LoginDataSourceImpl({required NetworkService service}) : _service = service;

  @override
  Future<LoginResponseModel> login(LoginRequestEntity loginRequestEntity) async {
    final response = await _service.unAuthedDio
        .post(EndPoints.loginEndPoint, data: jsonEncode(loginRequestEntity.toJson()));
    if (response.statusCode == 201 ||response.statusCode ==200 && (response.data as Map<String, dynamic>)["status"]  == true) {
      final Map<String, dynamic> responseData = response.data;
      return Future.value(
        LoginResponseModel.fromJson(responseData),
      );
    } else {
      throw ServerException(
        message: (response.data as Map<String, dynamic>)["message"],
        statusCode: response.statusCode ?? 0,
      );
    }
  }
}
