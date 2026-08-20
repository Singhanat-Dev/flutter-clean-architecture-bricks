import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/connectivity/connectivity_service.dart';
import '../../core/network/api_client.dart';
import '../../core/security/key_manager.dart';
import '../../core/storage/preferences_storage.dart';
import '../../core/storage/secure_storage.dart';

final secureStorageProvider = Provider<SecureStorage>((ref) {
  throw UnimplementedError('Must be initialized in initial_setup');
});

final preferencesStorageProvider = Provider<PreferencesStorage>((ref) {
  throw UnimplementedError('Must be initialized in initial_setup');
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return ApiClient(secureStorage);
});

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService();
});

final keyManagerProvider = Provider<KeyManager>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  return KeyManager(secureStorage);
});
