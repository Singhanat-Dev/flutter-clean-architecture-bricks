import 'package:get/get.dart';

class MainLayoutController extends GetxController {
  final RxBool isBlur = false.obs;

  void setBlur(bool value) {
    isBlur.value = value;
  }
}
