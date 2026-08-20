import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/storage/preferences_storage.dart';
import '../../shared/providers/shared_providers.dart';
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

  static String translate(String key, String languageCode) {
    return _translations[languageCode]?[key] ?? key;
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final storage = ref.watch(preferencesStorageProvider);
  return LocaleNotifier(storage);
});

class LocaleNotifier extends StateNotifier<Locale> {
  final PreferencesStorage _storage;

  LocaleNotifier(this._storage) : super(Locale(_storage.language));

  void setLocale(Locale locale) {
    _storage.setLanguage(locale.languageCode);
    state = locale;
  }

  void toggleLocale() {
    final next = state.languageCode == 'en' ? const Locale('th') : const Locale('en');
    setLocale(next);
  }
}
