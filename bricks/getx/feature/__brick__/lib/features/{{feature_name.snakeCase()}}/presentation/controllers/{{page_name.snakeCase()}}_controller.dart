import 'package:get/get.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/usecases/{{feature_name.snakeCase()}}_usecase.dart';

class {{page_name.pascalCase()}}Controller extends GetxController {
  final Get{{feature_name.pascalCase()}}UseCase get{{feature_name.pascalCase()}}UseCase;

  {{page_name.pascalCase()}}Controller({required this.get{{feature_name.pascalCase()}}UseCase});

  final RxBool isLoading = false.obs;
  final Rx<{{feature_name.pascalCase()}}Entity?> data = Rx<{{feature_name.pascalCase()}}Entity?>(null);
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await get{{feature_name.pascalCase()}}UseCase.execute();

    result.when(
      success: (item) {
        data.value = item;
      },
      failure: (message, statusCode, error) {
        errorMessage.value = message;
      },
    );

    isLoading.value = false;
  }
}

extension ApiResultExtension<T> on dynamic {
  void when({
    required void Function(dynamic data) success,
    required void Function(String message, int? statusCode, dynamic error) failure,
  }) {
    if (this is dynamic) {
      try {
        final d = (this as dynamic).data;
        success(d);
      } catch (_) {
        try {
          final m = (this as dynamic).message as String;
          final s = (this as dynamic).statusCode as int?;
          final e = (this as dynamic).error;
          failure(m, s, e);
        } catch (_) {}
      }
    }
  }
}
