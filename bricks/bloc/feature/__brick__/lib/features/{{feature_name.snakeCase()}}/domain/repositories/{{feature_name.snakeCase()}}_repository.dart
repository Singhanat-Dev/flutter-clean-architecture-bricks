import '../../../../core/network/api_result.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Future<ApiResult<{{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}();
}
