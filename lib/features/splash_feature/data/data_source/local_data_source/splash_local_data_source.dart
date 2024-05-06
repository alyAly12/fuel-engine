import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entity/splash_response_entity.dart';

abstract class SplashLocalDataSource {
  List<SplashResponseEntity> fetchAppSettings();
}

class SplashLocalDataSourceImpl extends SplashLocalDataSource {
  @override
  List<SplashResponseEntity> fetchAppSettings() {
    var box = Hive.box<SplashResponseEntity>(AppStrings.kSplashBox);
    return box.values.toList();
  }
}
