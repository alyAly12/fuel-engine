import 'dart:convert';

import 'package:sayarah/core/services/network_service.dart';
import 'package:sayarah/core/utils/endpoints.dart';
import 'package:sayarah/core/utils/errors/exceptions.dart';
import '../../domain/entities/pairing_request_entity.dart';
import '../models/pairing_response_model.dart';

abstract class PairingDataSource {
  Future<PairingResponseModel> pairing(
      PairingRequestEntity pairingRequestEntity);
}

class PairingDataSourceImplement implements PairingDataSource {
  final NetworkService _service;

  PairingDataSourceImplement({required NetworkService service})
      : _service = service;

  @override
  Future<PairingResponseModel> pairing(
      PairingRequestEntity pairingRequestEntity) async {
    final response = await _service.unAuthedDio.post(EndPoints.pairingEndPoint,
        data: jsonEncode(pairingRequestEntity.toJson()));
    final Map<String, dynamic> responseData = response.data;
    if(response.statusCode == 422){

      throw ServerException(
          message: (response.data as Map<String, dynamic>)["message"].toString(),
          statusCode: response.statusCode ?? 0);
  }
    if (response.statusCode == 201 ||response.statusCode ==200 && (response.data as Map<String, dynamic>)["status"] == true) {
      return Future.value(PairingResponseModel.fromJson(responseData));
    }else {
      throw ServerException(
          message: (response.data as Map<String, dynamic>)["message"].toString(),
          statusCode: response.statusCode ?? 0);
    }
  }
}
