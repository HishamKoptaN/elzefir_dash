import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../globals/database/shared_pref_keys.dart';

abstract interface class TokenStore {
  Future<String?> read();
  Future<void> write(String token);
  Future<void> clear();
}

/// توكن الويب يعيش في ذاكرة التطبيق فقط، ولا يُكتب إلى localStorage.
class MemoryTokenStore implements TokenStore {
  MemoryTokenStore._();

  static final MemoryTokenStore instance = MemoryTokenStore._();
  static String? _token;

  @override
  Future<String?> read() async => _token;

  @override
  Future<void> write(String token) async => _token = token;

  @override
  Future<void> clear() async => _token = null;
}

abstract interface class SecureKeyValueStore {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> delete(String key);
}

class FlutterSecureKeyValueStore implements SecureKeyValueStore {
  const FlutterSecureKeyValueStore();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  @override
  Future<void> delete(String key) => _storage.delete(key: key);
}

class PersistedTokenStore implements TokenStore {
  const PersistedTokenStore(this._storage);

  final SecureKeyValueStore _storage;

  @override
  Future<String?> read() => _storage.read(SharedPrefKeys.jwtToken);

  @override
  Future<void> write(String token) =>
      _storage.write(SharedPrefKeys.jwtToken, token);

  @override
  Future<void> clear() => _storage.delete(SharedPrefKeys.jwtToken);
}

TokenStore createTokenStore() {
  return kIsWeb
      ? MemoryTokenStore.instance
      : const PersistedTokenStore(FlutterSecureKeyValueStore());
}
