import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app/config/app_config.dart';
import '../core/storage/preferences_storage.dart';
import '../core/storage/secure_storage.dart';
import '../shared/providers/shared_providers.dart';

class InitialSetup {
  InitialSetup._();

  static Future<ProviderContainer> init() async {
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

    final container = ProviderContainer(
      overrides: [
        preferencesStorageProvider.overrideWithValue(preferencesStorage),
        secureStorageProvider.overrideWithValue(secureStorage),
      ],
    );

    return container;
  }
}
