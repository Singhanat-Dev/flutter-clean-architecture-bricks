import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/providers/shared_providers.dart';
import '../../data/datasources/{{feature_name.snakeCase()}}_local_datasource.dart';
import '../../data/datasources/{{feature_name.snakeCase()}}_remote_datasource.dart';
import '../../data/repositories/{{feature_name.snakeCase()}}_repository_impl.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../../domain/usecases/{{feature_name.snakeCase()}}_usecase.dart';

// Data Sources
final {{feature_name.camelCase()}}LocalDataSourceProvider = Provider<{{feature_name.pascalCase()}}LocalDataSource>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return {{feature_name.pascalCase()}}LocalDataSourceImpl(secureStorage);
});

final {{feature_name.camelCase()}}RemoteDataSourceProvider = Provider<{{feature_name.pascalCase()}}RemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return {{feature_name.pascalCase()}}RemoteDataSourceImpl(apiClient);
});

// Repository
final {{feature_name.camelCase()}}RepositoryProvider = Provider<{{feature_name.pascalCase()}}Repository>((ref) {
  return {{feature_name.pascalCase()}}RepositoryImpl(
    remoteDataSource: ref.watch({{feature_name.camelCase()}}RemoteDataSourceProvider),
    localDataSource: ref.watch({{feature_name.camelCase()}}LocalDataSourceProvider),
  );
});

// Use Case
final get{{feature_name.pascalCase()}}UseCaseProvider = Provider<Get{{feature_name.pascalCase()}}UseCase>((ref) {
  return Get{{feature_name.pascalCase()}}UseCase(ref.watch({{feature_name.camelCase()}}RepositoryProvider));
});

// State
class {{feature_name.pascalCase()}}State {
  final bool isLoading;
  final {{feature_name.pascalCase()}}Entity? data;
  final String? errorMessage;

  const {{feature_name.pascalCase()}}State({
    this.isLoading = false,
    this.data,
    this.errorMessage,
  });

  {{feature_name.pascalCase()}}State copyWith({
    bool? isLoading,
    {{feature_name.pascalCase()}}Entity? data,
    String? errorMessage,
  }) {
    return {{feature_name.pascalCase()}}State(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      errorMessage: errorMessage,
    );
  }
}

// StateNotifier
class {{feature_name.pascalCase()}}Notifier extends StateNotifier<{{feature_name.pascalCase()}}State> {
  final Get{{feature_name.pascalCase()}}UseCase _getUseCase;

  {{feature_name.pascalCase()}}Notifier(this._getUseCase) : super(const {{feature_name.pascalCase()}}State()) {
    fetchData();
  }

  Future<void> fetchData() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await _getUseCase.execute();

    result.when(
      success: (data) {
        state = state.copyWith(isLoading: false, data: data);
      },
      failure: (message, statusCode, error) {
        state = state.copyWith(isLoading: false, errorMessage: message);
      },
    );
  }
}

final {{feature_name.camelCase()}}NotifierProvider =
    StateNotifierProvider.autoDispose<{{feature_name.pascalCase()}}Notifier, {{feature_name.pascalCase()}}State>((ref) {
  final useCase = ref.watch(get{{feature_name.pascalCase()}}UseCaseProvider);
  return {{feature_name.pascalCase()}}Notifier(useCase);
});
