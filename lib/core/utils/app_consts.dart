import 'package:flutter/cupertino.dart';

class AppConsts {
  // Shared Prefs Key
  static var isLogged = "isLogged";
  static var token = "token";
  // API CONSTANTS
  static dynamic requestHeaders = {
    'Content-Type': 'application/json',
    'Charset': 'utf-8',
  };
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
