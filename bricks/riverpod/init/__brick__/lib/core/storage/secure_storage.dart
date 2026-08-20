import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  late final FlutterSecureStorage _storage;

  Future<SecureStorage> init() async {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    );
    return this;
  }

  Future<void> write(String key, String value) async => _storage.write(key: key, value: value);
  Future<String?> read(String key) async => _storage.read(key: key);
  Future<void> delete(String key) async => _storage.delete(key: key);
  Future<void> clearAll() async => _storage.deleteAll();
  Future<bool> containsKey(String key) async => _storage.containsKey(key: key);
}
