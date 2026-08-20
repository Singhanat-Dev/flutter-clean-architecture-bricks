import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/{{page_name.snakeCase()}}_provider.dart';

class {{page_name.pascalCase()}}Widget extends ConsumerWidget {
  const {{page_name.pascalCase()}}Widget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch({{page_name.camelCase()}}NotifierProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '{{page_name.titleCase()}} View',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            'Count: ${state.count}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.read({{page_name.camelCase()}}NotifierProvider.notifier).increment(),
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
