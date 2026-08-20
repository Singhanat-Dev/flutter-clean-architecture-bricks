import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/{{feature_name.snakeCase()}}_usecase.dart';
import '{{feature_name.snakeCase()}}_event.dart';
import '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  final Get{{feature_name.pascalCase()}}UseCase _getUseCase;

  {{feature_name.pascalCase()}}Bloc(this._getUseCase) : super(const {{feature_name.pascalCase()}}Initial()) {
    on<Fetch{{feature_name.pascalCase()}}Event>(_onFetchData);
  }

  Future<void> _onFetchData(
    Fetch{{feature_name.pascalCase()}}Event event,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) async {
    emit(const {{feature_name.pascalCase()}}Loading());

    final result = await _getUseCase.execute();

    result.when(
      success: (data) => emit({{feature_name.pascalCase()}}Loaded(data)),
      failure: (message, statusCode, error) => emit({{feature_name.pascalCase()}}Error(message)),
    );
  }
}
