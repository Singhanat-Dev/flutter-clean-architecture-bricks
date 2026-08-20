import 'package:get/get.dart';
import '../core/connectivity/connectivity_service.dart';
import '../core/network/api_client.dart';
import '../features/main_layout/presentation/controllers/main_layout_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ConnectivityService>(ConnectivityService(), permanent: true);
    Get.put<ApiClient>(ApiClient(), permanent: true);
    Get.put<MainLayoutController>(MainLayoutController(), permanent: true);
  }
}
