import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'localization/translations.dart';
import 'routes/app_router.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfig.instance.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
      locale: AppTranslations.currentLocale,
      supportedLocales: AppTranslations.supportedLocales,
    );
  }
}
