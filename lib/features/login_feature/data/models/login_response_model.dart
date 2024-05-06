import 'package:sayarah/features/login_feature/domain/entities/login_response_entity.dart';

import 'data.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({data, message, error, status})
      : super(data: data, message: message, error: error, status: status);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        data:
            json['data'] == null ? null : LoginData.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        error: json['error'] as List<dynamic>?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'error': error,
        'status': status,
      };
}
