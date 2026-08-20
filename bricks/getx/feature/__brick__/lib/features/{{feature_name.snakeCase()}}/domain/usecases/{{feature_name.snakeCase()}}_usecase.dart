import '../../../../core/network/api_result.dart';
import '../entities/{{feature_name.snakeCase()}}_entity.dart';
import '../repositories/{{feature_name.snakeCase()}}_repository.dart';

class Get{{feature_name.pascalCase()}}UseCase {
  final {{feature_name.pascalCase()}}Repository _repository;

  Get{{feature_name.pascalCase()}}UseCase(this._repository);

  Future<ApiResult<{{feature_name.pascalCase()}}Entity>> execute() {
    return _repository.get{{feature_name.pascalCase()}}();
  }
}
