import 'package:flutter_riverpod/flutter_riverpod.dart';

class {{page_name.pascalCase()}}State {
  final int count;

  const {{page_name.pascalCase()}}State({this.count = 0});

  {{page_name.pascalCase()}}State copyWith({int? count}) {
    return {{page_name.pascalCase()}}State(
      count: count ?? this.count,
    );
  }
}

class {{page_name.pascalCase()}}Notifier extends StateNotifier<{{page_name.pascalCase()}}State> {
  {{page_name.pascalCase()}}Notifier() : super(const {{page_name.pascalCase()}}State());

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }
}

final {{page_name.camelCase()}}NotifierProvider =
    StateNotifierProvider.autoDispose<{{page_name.pascalCase()}}Notifier, {{page_name.pascalCase()}}State>((ref) {
  return {{page_name.pascalCase()}}Notifier();
});
