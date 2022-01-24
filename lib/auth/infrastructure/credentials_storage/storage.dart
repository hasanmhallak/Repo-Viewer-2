import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage/secure_storage.dart';

class Storage implements SecureStorage {
  const Storage();

  String get _key => 'data';
  FlutterSecureStorage get _storage => const FlutterSecureStorage();

  @override
  Future<void> delete() => _storage.delete(key: _key);

  @override
  Future<String?> read() => _storage.read(key: _key);

  @override
  Future<void> save(String data) => _storage.write(key: _key, value: data);
}
