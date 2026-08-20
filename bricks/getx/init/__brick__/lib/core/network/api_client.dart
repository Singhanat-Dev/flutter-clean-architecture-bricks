import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../../app/config/app_constants.dart';
import 'api_endpoints.dart';
import 'api_exception.dart';
import 'interceptors/auth_interceptor.dart';

class ApiClient extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiEndpoints.baseUrl;
    httpClient.timeout = const Duration(milliseconds: AppConstants.connectTimeout);

    // Request Modifier
    httpClient.addRequestModifier(AuthInterceptor.requestInterceptor);

    // Response Modifier
    httpClient.addResponseModifier(AuthInterceptor.responseInterceptor);

    super.onInit();
  }

  Future<T> handleResponse<T>(Response response, T Function(dynamic data) fromJson) {
    if (response.isOk) {
      return Future.value(fromJson(response.body));
    } else {
      throw ApiException(
        message: response.statusText ?? 'An unknown error occurred',
        statusCode: response.statusCode,
        errorData: response.body,
      );
    }
  }
}
