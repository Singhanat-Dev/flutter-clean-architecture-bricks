import 'package:dio/dio.dart';
import '../../app/config/app_constants.dart';
import '../storage/secure_storage.dart';
import 'api_endpoints.dart';
import 'api_exception.dart';
import 'interceptors/auth_interceptor.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient(SecureStorage secureStorage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(milliseconds: AppConstants.connectTimeout),
        receiveTimeout: const Duration(milliseconds: AppConstants.receiveTimeout),
        sendTimeout: const Duration(milliseconds: AppConstants.sendTimeout),
      ),
    );

    _dio.interceptors.add(AuthInterceptor(secureStorage));
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Dio get dio => _dio;

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException(
        message: e.message ?? 'Unknown network error',
        statusCode: e.response?.statusCode,
        errorData: e.response?.data,
      );
    }
  }

  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
  }) async {
    try {
      final response = await _dio.post(path, data: data, queryParameters: queryParameters);
      return fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException(
        message: e.message ?? 'Unknown network error',
        statusCode: e.response?.statusCode,
        errorData: e.response?.data,
      );
    }
  }
}
