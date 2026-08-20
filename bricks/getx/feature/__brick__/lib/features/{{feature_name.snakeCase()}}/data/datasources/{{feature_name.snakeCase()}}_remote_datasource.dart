import '../../../../core/network/api_client.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';

abstract class {{feature_name.pascalCase()}}RemoteDataSource {
  Future<{{feature_name.pascalCase()}}Model> fetch{{feature_name.pascalCase()}}();
}

class {{feature_name.pascalCase()}}RemoteDataSourceImpl implements {{feature_name.pascalCase()}}RemoteDataSource {
  final ApiClient _apiClient;

  {{feature_name.pascalCase()}}RemoteDataSourceImpl(this._apiClient);

  @override
  Future<{{feature_name.pascalCase()}}Model> fetch{{feature_name.pascalCase()}}() async {
    final response = await _apiClient.get('/{{feature_name.paramCase()}}');
    return _apiClient.handleResponse<{{feature_name.pascalCase()}}Model>(
      response,
      (data) => {{feature_name.pascalCase()}}Model.fromJson(data as Map<String, dynamic>),
    );
  }
}
