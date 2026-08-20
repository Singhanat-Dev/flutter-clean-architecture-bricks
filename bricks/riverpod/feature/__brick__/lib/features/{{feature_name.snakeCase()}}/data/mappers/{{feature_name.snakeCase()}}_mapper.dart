import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';
import '../models/{{feature_name.snakeCase()}}_model.dart';

class {{feature_name.pascalCase()}}Mapper {
  static {{feature_name.pascalCase()}}Entity toEntity({{feature_name.pascalCase()}}Model model) {
    return {{feature_name.pascalCase()}}Entity(
      id: model.id,
      title: model.title,
    );
  }

  static {{feature_name.pascalCase()}}Model toModel({{feature_name.pascalCase()}}Entity entity) {
    return {{feature_name.pascalCase()}}Model(
      id: entity.id,
      title: entity.title,
    );
  }
}
