class ServerException implements Exception {
  final String message;
  final int statusCode;
  ServerException({required this.message, required this.statusCode});
}

class CacheException implements Exception {}
