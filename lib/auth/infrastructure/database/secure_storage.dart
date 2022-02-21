import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../auth_local_service.dart';

class SecureStorage implements AuthLocalService {
  const SecureStorage();

  String get _credentialsKey => 'credentials';
  String get _usernameKey => 'username';
  FlutterSecureStorage get _storage => const FlutterSecureStorage();
  @override
  Future<void> deleteCredentials() => _storage.delete(key: _credentialsKey);

  @override
  Future<String?> readCredentials() => _storage.read(key: _credentialsKey);

  @override
  Future<void> saveCredentials(String credentials) =>
      _storage.write(key: _credentialsKey, value: credentials);

  @override
  Future<void> deleteUsername() => _storage.delete(key: _usernameKey);

  @override
  Future<String?> readUsername() => _storage.read(key: _usernameKey);

  @override
  Future<void> saveUsername(String username) =>
      _storage.write(key: _usernameKey, value: username);
}
