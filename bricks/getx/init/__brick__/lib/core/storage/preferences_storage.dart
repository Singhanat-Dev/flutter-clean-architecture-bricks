import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../app/config/app_constants.dart';

class PreferencesStorage extends GetxService {
  late final GetStorage _box;

  Future<PreferencesStorage> init() async {
    await GetStorage.init();
    _box = GetStorage();
    return this;
  }

  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  Future<void> delete(String key) async {
    await _box.remove(key);
  }

  Future<void> clearAll() async {
    await _box.erase();
  }

  bool hasData(String key) {
    return _box.hasData(key);
  }

  // Language helpers
  String get language => read<String>(AppConstants.localeKey) ?? 'th';

  Future<void> setLanguage(String code) async {
    await write(AppConstants.localeKey, code);
  }
}
