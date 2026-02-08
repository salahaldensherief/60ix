import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalSecureStorage {
  Future<void> save(String value,String key);
  Future<String?> get(String key);
}
class SecureStorageImpl implements LocalSecureStorage {
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> save(String value,String key) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }
}
