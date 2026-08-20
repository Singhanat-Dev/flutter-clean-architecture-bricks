import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final featureName = context.vars['feature_name'] as String;
  final pageName = context.vars['page_name'] as String;

  final featureSnake = featureName.snakeCase;
  final pageSnake = pageName.snakeCase;
  final pageCamel = pageName.camelCase;
  final pagePascal = pageName.pascalCase;
  final pageParam = pageName.paramCase;

  final progress = context.logger.progress('Updating routes and pages in app...');

  // Search for app_routes.dart and app_pages.dart
  final appRoutesFile = _findFile('lib/app/routes/app_routes.dart');
  final appPagesFile = _findFile('lib/app/routes/app_pages.dart');

  if (appRoutesFile == null || appPagesFile == null) {
    progress.fail('Could not locate app_routes.dart or app_pages.dart');
    return;
  }

  try {
    // 1. Update app_routes.dart
    var routesContent = await appRoutesFile.readAsString();

    final routeDef = 'static const $pageCamel = _Paths.$pageCamel;';
    final pathDef = "static const $pageCamel = '/$pageParam';";

    if (!routesContent.contains(routeDef)) {
      // Add to Routes class
      final routesClassIndex = routesContent.indexOf('abstract class Routes {');
      if (routesClassIndex != -1) {
        final routesClassEnd = routesContent.indexOf('}', routesClassIndex);
        if (routesClassEnd != -1) {
          routesContent = routesContent.replaceRange(
            routesClassEnd,
            routesClassEnd,
            '  $routeDef\n',
          );
        }
      }

      // Add to _Paths class
      final pathsClassIndex = routesContent.indexOf('abstract class _Paths {');
      if (pathsClassIndex != -1) {
        final pathsClassEnd = routesContent.indexOf('}', pathsClassIndex);
        if (pathsClassEnd != -1) {
          routesContent = routesContent.replaceRange(
            pathsClassEnd,
            pathsClassEnd,
            '  $pathDef\n',
          );
        }
      }

      await appRoutesFile.writeAsString(routesContent);
    }

    // 2. Update app_pages.dart
    var pagesContent = await appPagesFile.readAsString();

    final bindingImport = "import '../../features/$featureSnake/presentation/bindings/${pageSnake}_binding.dart';";
    final pageImport = "import '../../features/$featureSnake/presentation/pages/${pageSnake}_page.dart';";

    if (!pagesContent.contains(bindingImport)) {
      final lastImportIndex = pagesContent.lastIndexOf("import '");
      if (lastImportIndex != -1) {
        final endOfLastImport = pagesContent.indexOf(';', lastImportIndex);
        pagesContent = pagesContent.replaceRange(
          endOfLastImport + 1,
          endOfLastImport + 1,
          '\n$bindingImport\n$pageImport',
        );
      }
    }

    final pageEntry = '''    GetPage(
      name: Routes.$pageCamel,
      page: () => const ${pagePascal}Page(),
      binding: ${pagePascal}Binding(),
    ),
''';

    if (!pagesContent.contains('name: Routes.$pageCamel')) {
      final routesListIndex = pagesContent.indexOf('static final routes = <GetPage>[');
      if (routesListIndex != -1) {
        // Insert before Routes.notFound or before closing bracket ];
        final notFoundIndex = pagesContent.indexOf('GetPage(\n      name: Routes.notFound', routesListIndex);
        if (notFoundIndex != -1) {
          pagesContent = pagesContent.replaceRange(
            notFoundIndex,
            notFoundIndex,
            '$pageEntry    ',
          );
        } else {
          final endOfRoutesList = pagesContent.indexOf('];', routesListIndex);
          if (endOfRoutesList != -1) {
            pagesContent = pagesContent.replaceRange(
              endOfRoutesList,
              endOfRoutesList,
              pageEntry,
            );
          }
        }
      }

      await appPagesFile.writeAsString(pagesContent);
    }

    progress.complete('Updated routes and pages successfully! 🚀');
  } catch (e) {
    progress.fail('Failed to update routes and pages: $e');
  }
}

File? _findFile(String relativePath) {
  final current = File(relativePath);
  if (current.existsSync()) return current;

  // Check parent directories or subdirectories
  for (final dir in Directory.current.listSync(recursive: true)) {
    if (dir is File && dir.path.endsWith(relativePath)) {
      return dir;
    }
  }
  return null;
}
