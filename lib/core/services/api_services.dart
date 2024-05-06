import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = 'https://api.syarahpay.com/api/';
  final Dio _dio;

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint, Object? data}) async {
    var response = await _dio.get('$_baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<Response> postData({required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        data: data,
        options: Options(method: 'POST', headers: {'Content-Type': 'application/json'}));
    return response;
  }

  Future<Response> loginData({required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        data: data,
        options: Options(method: 'POST', headers: {'Content-Type': 'application/json'}));
    return response;
  }
}
