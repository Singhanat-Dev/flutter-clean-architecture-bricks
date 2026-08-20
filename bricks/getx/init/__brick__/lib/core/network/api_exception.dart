class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic errorData;

  ApiException({
    required this.message,
    this.statusCode,
    this.errorData,
  });

  @override
  String toString() => 'ApiException: [$statusCode] $message';
}
