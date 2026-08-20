import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bootstrap/initial_setup.dart';
import '../bloc/{{feature_name.snakeCase()}}_bloc.dart';
import '../bloc/{{feature_name.snakeCase()}}_event.dart';
import '../bloc/{{feature_name.snakeCase()}}_state.dart';
import '../widgets/{{page_name.snakeCase()}}_form.dart';

class {{page_name.pascalCase()}}Page extends StatelessWidget {
  const {{page_name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<{{feature_name.pascalCase()}}Bloc>()..add(const Fetch{{feature_name.pascalCase()}}Event()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('{{page_name.titleCase()}}'),
        ),
        body: BlocBuilder<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
          builder: (context, state) {
            if (state is {{feature_name.pascalCase()}}Loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is {{feature_name.pascalCase()}}Error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.message, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => context.read<{{feature_name.pascalCase()}}Bloc>().add(const Fetch{{feature_name.pascalCase()}}Event()),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (state is {{feature_name.pascalCase()}}Loaded) {
              return {{page_name.pascalCase()}}Form(entity: state.data);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
