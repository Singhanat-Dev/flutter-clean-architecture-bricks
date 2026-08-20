import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/{{page_name.snakeCase()}}_controller.dart';

class {{page_name.pascalCase()}}Widget extends GetView<{{page_name.pascalCase()}}Controller> {
  const {{page_name.pascalCase()}}Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.isNotEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: controller.fetchData,
                child: const Text('Retry'),
              ),
            ],
          ),
        );
      }

      final item = controller.data.value;
      if (item == null) {
        return const Center(child: Text('No Data'));
      }

      return Center(
        child: Text(
          'Data: ${item.title}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    });
  }
}
