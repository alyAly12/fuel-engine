// import 'dart:convert';
// import 'package:sayarah/core/utils/app_strings.dart';
// import 'package:sayarah/features/splash_feature/data/models/splash_response_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../features/splash_feature/data/models/splash_data_model.dart';
//
//
// class LocalStorageData {
//
//   Future<SplashResponseModel?> get getSplash async{
//     try{
//       SplashResponseModel splashResponseModel = await getSPlashData();
//       return splashResponseModel;
//     }catch(e){
//       print(e.toString());
//     }
//     return null;
//
//   }
//
//   getSPlashData()async{
//     SharedPreferences prefs =await SharedPreferences.getInstance();
//     var value = prefs.getString(AppStrings.kSplashBox);
//     return SplashDataModel.fromJson(jsonDecode(value!));
//   }
//   setSplashData(SplashResponseModel model)async{
//     SharedPreferences prefs =await SharedPreferences.getInstance();
//     await prefs.setString(AppStrings.kSplashBox,json.encode(model));
//   }
// }