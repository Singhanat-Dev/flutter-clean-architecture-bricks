import '../../../../core/storage/secure_storage.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';

abstract class {{feature_name.pascalCase()}}LocalDataSource {
  Future<void> cache{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Model model);
  Future<{{feature_name.pascalCase()}}Model?> getCached{{feature_name.pascalCase()}}();
}

class {{feature_name.pascalCase()}}LocalDataSourceImpl implements {{feature_name.pascalCase()}}LocalDataSource {
  final SecureStorage _secureStorage;

  {{feature_name.pascalCase()}}LocalDataSourceImpl(this._secureStorage);

  static const String _cacheKey = 'CACHED_{{feature_name.constantCase()}}';

  @override
  Future<void> cache{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}Model model) async {
    // Cache logic
  }

  @override
  Future<{{feature_name.pascalCase()}}Model?> getCached{{feature_name.pascalCase()}}() async {
    // Read cache logic
    return null;
  }
}
