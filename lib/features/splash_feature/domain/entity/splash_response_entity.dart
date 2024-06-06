
import '../../data/models/splash_data_model.dart';

class SplashResponseEntity {
  SplashDataModel? splashData;
  String? message;
  List<dynamic>? error;
  bool? status;

  SplashResponseEntity(this.splashData, this.message, this.error, this.status);
}
