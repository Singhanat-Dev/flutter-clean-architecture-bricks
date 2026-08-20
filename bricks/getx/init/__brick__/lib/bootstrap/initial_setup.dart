import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../app/config/app_config.dart';
import '../core/storage/preferences_storage.dart';
import '../core/storage/secure_storage.dart';

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
    await Get.putAsync<PreferencesStorage>(() async => PreferencesStorage().init());
    await Get.putAsync<SecureStorage>(() async => SecureStorage().init());
  }
}
