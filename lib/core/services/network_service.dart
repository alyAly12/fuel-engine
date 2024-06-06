import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

import '../utils/app_consts.dart';
import '../utils/endpoints.dart';

class NetworkService {
  static NetworkService? _this;

  factory NetworkService() {
    _this ??= NetworkService._();
    return _this!;
  }

  List<String> allowedSha = [
    'cd81baffae76daa3eeef046f26dcd7bb74c2e6921b77c7f3b81563bca4ec2f9b',
    '8d760dc8a0a09de0189fccb550a8e2d998efbe327639e52415a9140f1423cf65',
    '5bb904e4d93df5ac5e5629b5a767a02d1ab78ec5470f8bfa63255541c915006e'
  ];

  Dio unAuthedDio = Dio();
  Dio authenticatedDio = Dio();
  Dio cmsDio = Dio();
  Dio cmsFAQDio = Dio();
  String? transactionID;
  String? _token;
  String? _authorizationToken;
  String? _locale = "en";
  static const storage = FlutterSecureStorage();
  final String _baseURL = EndPoints.baseUrl;

  NetworkService._() {
    unAuthedDio.options.baseUrl = _baseURL;
    unAuthedDio.options.connectTimeout = const Duration(seconds: 50);
    authenticatedDio.options.baseUrl = _baseURL;
    authenticatedDio.options.connectTimeout = const Duration(seconds: 50);

    var uuid = const Uuid();

    transactionID = uuid.v4();

    initializeInterceptors();
  }

  // void setToken(String? token) {
  //   _token = token;
  //   initializeInterceptors();
  // }
  final _accountNameController =
      TextEditingController(text: 'flutter_secure_storage_service');

  String? _getAccountName() =>
      _accountNameController.text.isEmpty ? null : _accountNameController.text;

  String? getToken() {
    return _token;
  }

  Future<void> setLocale(String locale) async {
    _locale = locale;
    initializeInterceptors();
  }

  void initializeInterceptors() {
    unAuthedDio.interceptors.clear();
    authenticatedDio.interceptors.clear();

    unAuthedDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions requestOptions,
          RequestInterceptorHandler handler,
        ) {
          requestOptions.headers.addAll(AppConsts.requestHeaders);
          requestOptions.headers.addAll(
            {
              'lang': _locale,
              "transactionId": transactionID,
            },
          );
          log("url: ${requestOptions.uri.path}");
          log("headers: ${requestOptions.headers}");
          log("body: ${requestOptions.data}");
          handler.next(requestOptions);
        },
        onResponse: (
          Response<dynamic> response,
          ResponseInterceptorHandler handler,
        ) {
          log("status code: ${response.statusCode}");
          log("response: ${response.data}");
          handler.next(response);
        },
        onError: (
          DioException error,
          ErrorInterceptorHandler errorHandler,
        ) {
          EasyLoading.dismiss();
          if (error.response?.statusCode == 400) {
            //TODO TOAST
          } else if (error.response?.statusCode == 422) {
            Fluttertoast.showToast(msg: "Wrong data");
          }else if (error.response?.statusCode == null) {
            Fluttertoast.showToast(msg: "Check your connection");
          }

          log("error status code: ${error.response?.statusCode}");
          log("error: ${error.response?.data}");
          log("errorMessage: ${error.message}");
          errorHandler.next(error);
        },
      ),
    );

    authenticatedDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
          RequestOptions requestOptions,
          RequestInterceptorHandler handler,
        ) async {
          requestOptions.headers.addAll(AppConsts.requestHeaders);

          await getJWTToken();
          //TODO update the token and lang
          requestOptions.headers.addAll(
            {
              'lang': _locale,
              "transactionId": transactionID,
              'jwtToken': _token,
              'Authorization': _authorizationToken,
              "X-TIB-TransactionID": transactionID,
            },
          );
          print("transactionID: $transactionID");
          print("url: ${requestOptions.uri.path}");
          print("params: ${requestOptions.uri.queryParameters}");
          print("headers: ${requestOptions.headers}");
          print("body: ${requestOptions.data}");
          handler.next(requestOptions);
        },
        onResponse: (
          Response<dynamic> response,
          ResponseInterceptorHandler handler,
        ) {
          log("status code: ${response.statusCode}");
          log("response: ${response.data}");
          handler.next(response);
        },
        onError: (
          DioException error,
          ErrorInterceptorHandler errorHandler,
        ) async {
          EasyLoading.dismiss();
          log("error status code: ${error.response?.statusCode}");
          log("error: ${error.response?.data}");
          log("errorMessage: ${error.message}");
          if (error.response?.statusCode == 400) {
            //TODO TOAST
          } else if (error.response?.statusCode == 422) {
            Fluttertoast.showToast(msg: "Wrong data");
          }else if (error.response?.statusCode == null) {
            Fluttertoast.showToast(msg: "Check your connection");
          }

          errorHandler.next(error);
        },
      ),
    );
  }

  Future<String?> getJWTToken() async {
    _authorizationToken = await storage.read(
      key: AppConsts.token,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    if (_authorizationToken != null) {
      _token = _authorizationToken!.replaceAll('Bearer ', '');
    }

    return _authorizationToken;
  }

  // secure storage options
  IOSOptions _getIOSOptions() => IOSOptions(
        accountName: _getAccountName(),
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        // sharedPreferencesName: 'Test2',
        // preferencesKeyPrefix: 'Test'
      );
}
