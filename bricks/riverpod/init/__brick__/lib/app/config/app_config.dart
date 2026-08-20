enum Flavor { development, staging, production }

class AppConfig {
  static AppConfig? _instance;

  final String appName;
  final Flavor flavor;

  AppConfig._({
    required this.appName,
    required this.flavor,
  });

  static void init({
    required String appName,
    required Flavor flavor,
  }) {
    _instance = AppConfig._(
      appName: appName,
      flavor: flavor,
    );
  }

  static AppConfig get instance {
    _instance ??= AppConfig._(
      appName: '{{application_title}}',
      flavor: Flavor.production,
    );
    return _instance!;
  }

  bool get isDevelopment => flavor == Flavor.development;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProduction => flavor == Flavor.production;
}
