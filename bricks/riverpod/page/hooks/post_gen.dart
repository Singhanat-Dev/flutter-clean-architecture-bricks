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

  final progress = context.logger.progress('Updating routes and router in app...');

  final appRoutesFile = _findFile('lib/app/routes/app_routes.dart');
  final appRouterFile = _findFile('lib/app/routes/app_router.dart');

  if (appRoutesFile == null || appRouterFile == null) {
    progress.fail('Could not locate app_routes.dart or app_router.dart');
    return;
  }

  try {
    // 1. Update app_routes.dart
    var routesContent = await appRoutesFile.readAsString();
    final routeDef = "static const $pageCamel = '/$pageParam';";

    if (!routesContent.contains(routeDef)) {
      final routesClassIndex = routesContent.indexOf('abstract class AppRoutes {');
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
      await appRoutesFile.writeAsString(routesContent);
    }

    // 2. Update app_router.dart
    var routerContent = await appRouterFile.readAsString();
    final pageImport = "import '../../features/$featureSnake/presentation/pages/${pageSnake}_page.dart';";

    if (!routerContent.contains(pageImport)) {
      final lastImportIndex = routerContent.lastIndexOf("import '");
      if (lastImportIndex != -1) {
        final endOfLastImport = routerContent.indexOf(';', lastImportIndex);
        routerContent = routerContent.replaceRange(
          endOfLastImport + 1,
          endOfLastImport + 1,
          '\n$pageImport',
        );
      }
    }

    final routeEntry = '''      GoRoute(
        path: AppRoutes.$pageCamel,
        builder: (context, state) => const ${pagePascal}Page(),
      ),
''';

    if (!routerContent.contains('path: AppRoutes.$pageCamel')) {
      final routesListIndex = routerContent.indexOf('routes: [');
      if (routesListIndex != -1) {
        final endOfRoutesList = routerContent.indexOf('],', routesListIndex);
        if (endOfRoutesList != -1) {
          routerContent = routerContent.replaceRange(
            endOfRoutesList,
            endOfRoutesList,
            routeEntry,
          );
        }
      }
      await appRouterFile.writeAsString(routerContent);
    }

    progress.complete('Updated routes and router successfully! 🚀');
  } catch (e) {
    progress.fail('Failed to update routes and router: $e');
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
