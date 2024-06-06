
import '../../data/models/data.dart';

class LoginResponseEntity {
  LoginData? data;
  String? message;
  List<dynamic>? error;
  bool? status;

  LoginResponseEntity({this.data, this.message, this.error, this.status});
}
