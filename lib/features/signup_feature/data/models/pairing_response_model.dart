import '../../domain/entities/pairing_response_entity.dart';
import 'pairing_data_model.dart';

class PairingResponseModel extends PairingResponseEntity {
  PairingResponseModel({data, message, error, status})
      : super(data: data, message: message, error: error, status: status);

  factory PairingResponseModel.fromJson(Map<String, dynamic> json) => PairingResponseModel(
        data: json['data'] == null
            ? null
            : PairingDataModel.fromMap(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        error: json['error'] as List<dynamic>?,
        status: json['status'] as bool?,
      );
}
