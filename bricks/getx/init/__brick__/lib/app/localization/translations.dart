import 'dart:ui';
import 'package:get/get.dart';
import '../../core/storage/preferences_storage.dart';
import 'en.dart';
import 'th.dart';

class AppTranslations extends Translations {
  AppTranslations(this._storage);

  final PreferencesStorage _storage;

  final RxString currentLanguage = RxString('th');

  final Locale defaultLocale = const Locale('th');

  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en': en,
        'th': th,
      };

  Locale getSavedLocale() {
    final String code = _storage.language;
    currentLanguage.value = code;
    return Locale(code);
  }

  void saveAndUpdateLocale(Locale locale) {
    _storage.setLanguage(locale.languageCode);
    currentLanguage.value = locale.languageCode;
    Get.updateLocale(locale);
  }

  void toggleLocale() {
    final String current = currentLanguage.value;
    final Locale next = current == 'en' ? const Locale('th') : const Locale('en');
    saveAndUpdateLocale(next);
  }
}
