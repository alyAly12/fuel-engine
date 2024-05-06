
import 'package:hive/hive.dart';

import '../../features/splash_feature/domain/entity/splash_response_entity.dart';


void saveLocalSetings(List<SplashResponseEntity> splash, String boxName) {
  var box = Hive.box<SplashResponseEntity>(boxName);
  box.add(splash as SplashResponseEntity);
}

