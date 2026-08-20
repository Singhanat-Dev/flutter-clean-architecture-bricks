import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../../../app/config/app_constants.dart';
import '../../storage/secure_storage.dart';

class AuthInterceptor {
  static FutureOr<Request> requestInterceptor(Request request) async {
    if (Get.isRegistered<SecureStorage>()) {
      final storage = Get.find<SecureStorage>();
      final token = await storage.read(AppConstants.tokenKey);
      if (token != null && token.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $token';
      }
    }
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'application/json';
    return request;
  }

  static FutureOr<Response> responseInterceptor(Request request, Response response) {
    if (response.status.hasError) {
      if (response.statusCode == 401) {
        // Handle 401 Unauthorized / Token Expiration
      }
    }
    return response;
  }
}
