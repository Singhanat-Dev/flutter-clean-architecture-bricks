import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/{{page_name.snakeCase()}}_controller.dart';

class {{page_name.pascalCase()}}Widget extends GetView<{{page_name.pascalCase()}}Controller> {
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
          const SizedBox(height: 16),
          Obx(() => Text(
                'Count: ${controller.count.value}',
                style: Theme.of(context).textTheme.titleMedium,
              )),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: controller.increment,
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
