import '../storage/secure_storage.dart';

class KeyManager {
  final SecureStorage _secureStorage;

  KeyManager(this._secureStorage);

  Future<void> saveApiKey(String key, String value) async {
    await _secureStorage.write('API_KEY_$key', value);
  }

  Future<String?> getApiKey(String key) async {
    return await _secureStorage.read('API_KEY_$key');
  }

  Future<void> removeApiKey(String key) async {
    await _secureStorage.delete('API_KEY_$key');
  }
}
