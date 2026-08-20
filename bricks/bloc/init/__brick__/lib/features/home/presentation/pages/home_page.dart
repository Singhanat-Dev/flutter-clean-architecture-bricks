import 'package:flutter/material.dart';
import '../../../app/config/app_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.instance.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home_outlined, size: 64, color: Colors.blueAccent),
            const SizedBox(height: 16),
            Text(
              'Welcome to ${AppConfig.instance.appName}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
