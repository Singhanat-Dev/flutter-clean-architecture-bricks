import 'package:shared_preferences/shared_preferences.dart';
import '../../app/config/app_constants.dart';

class PreferencesStorage {
  late final SharedPreferences _prefs;

  Future<PreferencesStorage> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  String? getString(String key) => _prefs.getString(key);
  Future<bool> setString(String key, String value) => _prefs.setString(key, value);
  bool? getBool(String key) => _prefs.getBool(key);
  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);
  int? getInt(String key) => _prefs.getInt(key);
  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);
  Future<bool> remove(String key) => _prefs.remove(key);
  Future<bool> clearAll() => _prefs.clear();

  String get language => getString(AppConstants.localeKey) ?? 'th';
  Future<bool> setLanguage(String code) => setString(AppConstants.localeKey, code);
}
