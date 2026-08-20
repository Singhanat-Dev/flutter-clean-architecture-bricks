import 'package:flutter/material.dart';
import '../widgets/{{page_name.snakeCase()}}_widget.dart';

class {{page_name.pascalCase()}}Page extends StatelessWidget {
  const {{page_name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{page_name.titleCase()}}'),
      ),
      body: const {{page_name.pascalCase()}}Widget(),
    );
  }
}
