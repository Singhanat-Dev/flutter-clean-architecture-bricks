import '../../../../core/network/api_exception.dart';
import '../../../../core/network/api_result.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../datasources/{{feature_name.snakeCase()}}_local_datasource.dart';
import '../datasources/{{feature_name.snakeCase()}}_remote_datasource.dart';
import '../mappers/{{feature_name.snakeCase()}}_mapper.dart';

class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource _remoteDataSource;
  final {{feature_name.pascalCase()}}LocalDataSource _localDataSource;

  {{feature_name.pascalCase()}}RepositoryImpl({
    required {{feature_name.pascalCase()}}RemoteDataSource remoteDataSource,
    required {{feature_name.pascalCase()}}LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<ApiResult<{{feature_name.pascalCase()}}Entity>> get{{feature_name.pascalCase()}}() async {
    try {
      final model = await _remoteDataSource.fetch{{feature_name.pascalCase()}}();
      final entity = {{feature_name.pascalCase()}}Mapper.toEntity(model);
      return ApiResult.success(entity);
    } on ApiException catch (e) {
      return ApiResult.failure(e.message, statusCode: e.statusCode, error: e.errorData);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
