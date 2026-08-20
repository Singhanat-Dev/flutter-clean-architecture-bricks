import 'dart:ui';
import '../../bootstrap/initial_setup.dart';
import '../../core/storage/preferences_storage.dart';
import 'en.dart';
import 'th.dart';

class AppTranslations {
  static const supportedLocales = [
    Locale('th'),
    Locale('en'),
  ];

  static final Map<String, Map<String, String>> _translations = {
    'en': en,
    'th': th,
  };

  static Locale get currentLocale {
    if (sl.isRegistered<PreferencesStorage>()) {
      return Locale(sl<PreferencesStorage>().language);
    }
    return const Locale('th');
  }

  static String translate(String key, [String? languageCode]) {
    final code = languageCode ?? currentLocale.languageCode;
    return _translations[code]?[key] ?? key;
  }
}
