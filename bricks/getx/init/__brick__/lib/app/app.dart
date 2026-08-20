import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bootstrap/initial_binding.dart';
import '../core/storage/preferences_storage.dart';
import '../features/main_layout/presentation/pages/main_layout_page.dart';
import 'config/app_config.dart';
import 'localization/translations.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<PreferencesStorage>();
    final appTranslations = AppTranslations(storage);
    Get.put<AppTranslations>(appTranslations, permanent: true);

    return GetMaterialApp(
      title: AppConfig.instance.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialBinding: InitialBinding(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      translations: appTranslations,
      locale: appTranslations.getSavedLocale(),
      fallbackLocale: appTranslations.defaultLocale,
      routingCallback: (routing) {
        if (routing != null) {
          final String currentRoute = routing.current;
          final bool isBack = routing.isBack ?? false;
          final bool isDialog = routing.isDialog ?? false;
          final bool isBottomSheet = routing.isBottomSheet ?? false;

          if (!isDialog && !isBottomSheet && currentRoute.isNotEmpty) {
            if (isBack) {
              // Page Return
            } else {
              // Page Push
            }
          }
        }
      },
      builder: (context, child) {
        return MainLayoutPage(
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
