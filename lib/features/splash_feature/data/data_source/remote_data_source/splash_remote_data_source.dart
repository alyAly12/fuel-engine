
import '../../../../../core/services/network_service.dart';
import '../../../../../core/utils/endpoints.dart';
import '../../../../../core/utils/errors/exceptions.dart';
import '../../../domain/entity/splash_response_entity.dart';
import '../../models/splash_response_model.dart';

abstract class SplashRemoteDataSource {
  Future<SplashResponseModel> setting(SplashResponseEntity splashResponseEntity);
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final NetworkService _service;
  SplashRemoteDataSourceImpl({required NetworkService service}) : _service = service;
  @override
  Future<SplashResponseModel> setting(SplashResponseEntity splashResponseEntity) async {
    final response = await _service.unAuthedDio.get(
      EndPoints.settingEndPoint,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      // LocalStorageData().setSplashData(SplashResponseModel());
      return SplashResponseModel.fromJson(responseData);
    } else {

      throw ServerException(
          message: (response.data as Map<String, dynamic>)["message"],
          statusCode: response.statusCode ?? 0);
    }
  }
}
