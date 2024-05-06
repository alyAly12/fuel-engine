import 'package:sayarah/features/splash_feature/data/models/splash_data_model.dart';
import 'package:sayarah/features/splash_feature/domain/entity/splash_response_entity.dart';

class SplashResponseModel extends SplashResponseEntity {
  SplashResponseModel({data, message, error, status}) : super(data, message, error, status);

  factory SplashResponseModel.fromJson(Map<String, dynamic> json) => SplashResponseModel(
        data: json['data'] == null
            ? null
            : SplashDataModel.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
        error: json['error'] as List<dynamic>?,
        status: json['status'] as bool?,
      );
}
