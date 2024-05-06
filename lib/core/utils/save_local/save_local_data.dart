import 'package:hive/hive.dart';
import 'package:sayarah/features/splash_feature/data/models/splash_data_model.dart';

void saveSplashlocalData(SplashDataModel splashDataModel, String boxName) {
  var box = Hive.box<SplashDataModel>(boxName);
  box.add(splashDataModel);
}
