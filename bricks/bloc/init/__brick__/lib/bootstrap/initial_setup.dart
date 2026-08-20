import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import '../app/config/app_config.dart';
import '../core/connectivity/connectivity_service.dart';
import '../core/network/api_client.dart';
import '../core/security/key_manager.dart';
import '../core/storage/preferences_storage.dart';
import '../core/storage/secure_storage.dart';

final sl = GetIt.instance;

class InitialSetup {
  InitialSetup._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Initialize App Config
    AppConfig.init(
      appName: '{{application_title}}',
      flavor: Flavor.production,
    );

    // Initialize Storage Services
    final preferencesStorage = await PreferencesStorage().init();
    final secureStorage = await SecureStorage().init();

    // Register Core Dependencies in Service Locator
    sl.registerLazySingleton<PreferencesStorage>(() => preferencesStorage);
    sl.registerLazySingleton<SecureStorage>(() => secureStorage);
    sl.registerLazySingleton<ApiClient>(() => ApiClient(sl<SecureStorage>()));
    sl.registerLazySingleton<ConnectivityService>(() => ConnectivityService());
    sl.registerLazySingleton<KeyManager>(() => KeyManager(sl<SecureStorage>()));
  }
}
