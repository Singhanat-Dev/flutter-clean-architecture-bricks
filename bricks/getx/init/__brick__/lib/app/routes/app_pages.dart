import 'package:get/get.dart';
import '../../features/not_found/presentation/pages/not_found_page.dart';
import '../../features/splash/presentation/bindings/splash_binding.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final unknownRoute = GetPage(
    name: Routes.notFound,
    page: () => const NotFoundPage(),
  );

  static final routes = <GetPage>[
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.notFound,
      page: () => const NotFoundPage(),
    ),
  ];
}
