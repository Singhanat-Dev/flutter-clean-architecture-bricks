import 'package:flutter/material.dart';
import '../../domain/entities/{{feature_name.snakeCase()}}_entity.dart';

class {{page_name.pascalCase()}}Form extends StatelessWidget {
  final {{feature_name.pascalCase()}}Entity? entity;

  const {{page_name.pascalCase()}}Form({super.key, this.entity});

  @override
  Widget build(BuildContext context) {
    if (entity == null) {
      return const Center(child: Text('No Data'));
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title: ${entity!.title}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'ID: ${entity!.id}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
