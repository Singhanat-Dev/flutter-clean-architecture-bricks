import 'package:flutter/material.dart';

class {{page_name.pascalCase()}}Widget extends StatelessWidget {
  const {{page_name.pascalCase()}}Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '{{page_name.titleCase()}} View',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
