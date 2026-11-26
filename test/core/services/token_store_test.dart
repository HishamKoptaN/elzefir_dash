import 'package:alzefr_dash/core/globals/database/shared_pref_keys.dart';
import 'package:alzefr_dash/core/services/token_store.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeSecureStore implements SecureKeyValueStore {
  final Map<String, String> values = {};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String value) async => values[key] = value;

  @override
  Future<void> delete(String key) async => values.remove(key);
}

void main() {
  setUp(() async => MemoryTokenStore.instance.clear());

  test('persisted store uses the jwt key only', () async {
    final storage = _FakeSecureStore();
    final store = PersistedTokenStore(storage);

    await store.write('secret');
    expect(storage.values[SharedPrefKeys.jwtToken], 'secret');
    expect(await store.read(), 'secret');

    await store.clear();
    expect(storage.values, isEmpty);
  });

  test('memory store is shared but never persisted', () async {
    final store = MemoryTokenStore.instance;
    await store.write('web-secret');

    expect(await store.read(), 'web-secret');
    expect(await MemoryTokenStore.instance.read(), 'web-secret');

    await store.clear();
    expect(await MemoryTokenStore.instance.read(), isNull);
  });

  test('native platforms keep the persisted store', () {
    expect(createTokenStore(), isA<PersistedTokenStore>());
  });
}
