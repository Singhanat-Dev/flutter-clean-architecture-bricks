class {{feature_name.pascalCase()}}Model {
  final String id;
  final String title;

  const {{feature_name.pascalCase()}}Model({
    required this.id,
    required this.title,
  });

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{feature_name.pascalCase()}}Model(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
