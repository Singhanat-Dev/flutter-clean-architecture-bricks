import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final featureName = context.vars['feature_name'] as String;
  final pageName = context.vars['page_name'] as String;

  final featureSnake = featureName.snakeCase;
  final featurePascal = featureName.pascalCase;
  final pageSnake = pageName.snakeCase;
  final pageCamel = pageName.camelCase;
  final pagePascal = pageName.pascalCase;
  final pageParam = pageName.paramCase;

  final progress = context.logger.progress('Updating routes, router, and DI in app...');

  final appRoutesFile = _findFile('lib/app/routes/app_routes.dart');
  final appRouterFile = _findFile('lib/app/routes/app_router.dart');
  final initialSetupFile = _findFile('lib/bootstrap/initial_setup.dart');

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

    // 3. Update initial_setup.dart with DI for the new feature
    if (initialSetupFile != null) {
      var setupContent = await initialSetupFile.readAsString();

      final featureImports = '''import '../features/$featureSnake/data/datasources/${featureSnake}_local_datasource.dart';
import '../features/$featureSnake/data/datasources/${featureSnake}_remote_datasource.dart';
import '../features/$featureSnake/data/repositories/${featureSnake}_repository_impl.dart';
import '../features/$featureSnake/domain/repositories/${featureSnake}_repository.dart';
import '../features/$featureSnake/domain/usecases/${featureSnake}_usecase.dart';
import '../features/$featureSnake/presentation/bloc/${featureSnake}_bloc.dart';
''';

      if (!setupContent.contains('${featureSnake}_bloc.dart')) {
        final lastImportIndex = setupContent.lastIndexOf("import '");
        if (lastImportIndex != -1) {
          final endOfLastImport = setupContent.indexOf(';', lastImportIndex);
          setupContent = setupContent.replaceRange(
            endOfLastImport + 1,
            endOfLastImport + 1,
            '\n$featureImports',
          );
        }
      }

      final diRegistrations = '''
    // $featurePascal Feature
    sl.registerLazySingleton<${featurePascal}LocalDataSource>(() => ${featurePascal}LocalDataSourceImpl(sl<SecureStorage>()));
    sl.registerLazySingleton<${featurePascal}RemoteDataSource>(() => ${featurePascal}RemoteDataSourceImpl(sl<ApiClient>()));
    sl.registerLazySingleton<${featurePascal}Repository>(() => ${featurePascal}RepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));
    sl.registerLazySingleton<Get${featurePascal}UseCase>(() => Get${featurePascal}UseCase(sl()));
    sl.registerFactory<${featurePascal}Bloc>(() => ${featurePascal}Bloc(sl()));
''';

      if (!setupContent.contains('${featurePascal}Bloc')) {
        final initMethodIndex = setupContent.indexOf('static Future<void> init() async {');
        if (initMethodIndex != -1) {
          final initMethodEnd = setupContent.indexOf('}', initMethodIndex);
          if (initMethodEnd != -1) {
            setupContent = setupContent.replaceRange(
              initMethodEnd,
              initMethodEnd,
              diRegistrations,
            );
          }
        }
        await initialSetupFile.writeAsString(setupContent);
      }
    }

    progress.complete('Updated routes, router, and DI successfully! 🚀');
  } catch (e) {
    progress.fail('Failed to update routes, router, or DI: $e');
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
