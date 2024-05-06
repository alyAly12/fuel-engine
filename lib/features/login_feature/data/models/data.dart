import 'package:sayarah/features/login_feature/data/models/worker.dart';

class LoginData {
  Worker? worker;
  String? token;

  LoginData({this.worker, this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        worker:
            json['worker'] == null ? null : Worker.fromJson(json['worker'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'worker': worker?.toJson(),
        'token': token,
      };
}
