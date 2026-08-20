import 'package:equatable/equatable.dart';

abstract class {{feature_name.pascalCase()}}Event extends Equatable {
  const {{feature_name.pascalCase()}}Event();

  @override
  List<Object?> get props => [];
}

class Fetch{{feature_name.pascalCase()}}Event extends {{feature_name.pascalCase()}}Event {
  const Fetch{{feature_name.pascalCase()}}Event();
}
