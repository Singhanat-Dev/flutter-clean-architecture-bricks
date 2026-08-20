import 'package:get/get.dart';

class {{page_name.pascalCase()}}Controller extends GetxController {
  final RxInt count = 0.obs;

  void increment() => count.value++;
}
