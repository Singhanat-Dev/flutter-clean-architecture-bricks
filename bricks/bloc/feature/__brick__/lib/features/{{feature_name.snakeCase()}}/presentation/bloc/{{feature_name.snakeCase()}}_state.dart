import 'package:equatable/equatable.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';

abstract class {{feature_name.pascalCase()}}State extends Equatable {
  const {{feature_name.pascalCase()}}State();

  @override
  List<Object?> get props => [];
}

class {{feature_name.pascalCase()}}Initial extends {{feature_name.pascalCase()}}State {
  const {{feature_name.pascalCase()}}Initial();
}

class {{feature_name.pascalCase()}}Loading extends {{feature_name.pascalCase()}}State {
  const {{feature_name.pascalCase()}}Loading();
}

class {{feature_name.pascalCase()}}Loaded extends {{feature_name.pascalCase()}}State {
  final {{feature_name.pascalCase()}}Entity data;

  const {{feature_name.pascalCase()}}Loaded(this.data);

  @override
  List<Object?> get props => [data];
}

class {{feature_name.pascalCase()}}Error extends {{feature_name.pascalCase()}}State {
  final String message;

  const {{feature_name.pascalCase()}}Error(this.message);

  @override
  List<Object?> get props => [message];
}
