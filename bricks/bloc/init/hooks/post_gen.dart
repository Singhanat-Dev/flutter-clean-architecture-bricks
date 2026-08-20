import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final dependencies = [
    'flutter_bloc:^8.1.6',
    'equatable:^2.0.5',
    'get_it:^7.7.0',
    'go_router:^14.2.0',
    'dio:^5.4.3+1',
    'shared_preferences:^2.2.3',
    'flutter_secure_storage:^9.2.2',
    'connectivity_plus:^6.1.0',
    'crypto:^3.0.6',
  ];

  final progress = context.logger.progress('Installing dependencies via flutter pub add...');

  try {
    final result = await Process.run(
      'flutter',
      ['pub', 'add', ...dependencies],
      runInShell: true,
    );

    if (result.exitCode == 0) {
      progress.complete('Dependencies installed successfully! 🚀');
    } else {
      progress.complete('Completed flutter pub add');
      context.logger.warn('flutter pub add exited with code ${result.exitCode}. Updating pubspec.yaml directly...');
      await _injectDependencies(context, dependencies);
    }
  } catch (e) {
    progress.complete('Completed with notice');
    context.logger.warn('Could not run flutter command. Updating pubspec.yaml directly...');
    await _injectDependencies(context, dependencies);
  }
}

Future<void> _injectDependencies(HookContext context, List<String> dependencies) async {
  final pubspecFile = _findFile('pubspec.yaml');
  if (pubspecFile == null) {
    context.logger.err('Could not locate pubspec.yaml to install dependencies.');
    return;
  }

  try {
    var content = await pubspecFile.readAsString();
    final depIndex = content.indexOf('dependencies:');
    if (depIndex != -1) {
      final buffer = StringBuffer();
      for (final dep in dependencies) {
        final parts = dep.split(':');
        final name = parts[0];
        final version = parts.length > 1 ? parts[1] : 'any';
        if (!content.contains('$name:')) {
          buffer.writeln('  $name: $version');
        }
      }
      if (buffer.isNotEmpty) {
        final insertPos = content.indexOf('\n', depIndex) + 1;
        content = content.replaceRange(insertPos, insertPos, buffer.toString());
        await pubspecFile.writeAsString(content);
        context.logger.success('Added dependencies directly to pubspec.yaml! ✅');
      }
    }
  } catch (e) {
    context.logger.err('Failed to update pubspec.yaml: $e');
  }
}

File? _findFile(String relativePath) {
  final current = File(relativePath);
  if (current.existsSync()) return current;

  for (final dir in Directory.current.listSync(recursive: true)) {
    if (dir is File && dir.path.endsWith(relativePath)) {
      return dir;
    }
  }
  return null;
}
