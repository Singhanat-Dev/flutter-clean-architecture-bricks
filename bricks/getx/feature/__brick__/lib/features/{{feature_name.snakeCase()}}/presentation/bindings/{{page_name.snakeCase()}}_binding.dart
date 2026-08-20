import 'package:get/get.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../data/datasources/{{feature_name.snakeCase()}}_local_datasource.dart';
import '../../data/datasources/{{feature_name.snakeCase()}}_remote_datasource.dart';
import '../../data/repositories/{{feature_name.snakeCase()}}_repository_impl.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../../domain/usecases/{{feature_name.snakeCase()}}_usecase.dart';
import '../controllers/{{page_name.snakeCase()}}_controller.dart';

class {{page_name.pascalCase()}}Binding extends Bindings {
  @override
  void dependencies() {
    // Data Sources
    Get.lazyPut<{{feature_name.pascalCase()}}LocalDataSource>(
      () => {{feature_name.pascalCase()}}LocalDataSourceImpl(Get.find<SecureStorage>()),
    );
    Get.lazyPut<{{feature_name.pascalCase()}}RemoteDataSource>(
      () => {{feature_name.pascalCase()}}RemoteDataSourceImpl(Get.find<ApiClient>()),
    );

    // Repository
    Get.lazyPut<{{feature_name.pascalCase()}}Repository>(
      () => {{feature_name.pascalCase()}}RepositoryImpl(
        remoteDataSource: Get.find<{{feature_name.pascalCase()}}RemoteDataSource>(),
        localDataSource: Get.find<{{feature_name.pascalCase()}}LocalDataSource>(),
      ),
    );

    // Use Cases
    Get.lazyPut<Get{{feature_name.pascalCase()}}UseCase>(
      () => Get{{feature_name.pascalCase()}}UseCase(Get.find<{{feature_name.pascalCase()}}Repository>()),
    );

    // Controller
    Get.lazyPut<{{page_name.pascalCase()}}Controller>(
      () => {{page_name.pascalCase()}}Controller(
        get{{feature_name.pascalCase()}}UseCase: Get.find<Get{{feature_name.pascalCase()}}UseCase>(),
      ),
    );
  }
}
