import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../local_service.dart';

class SecureStorage implements LocalService {
  const SecureStorage();

  String get _key => 'data';
  FlutterSecureStorage get _storage => const FlutterSecureStorage();

  @override
  Future<void> delete() => _storage.delete(key: _key);

  @override
  Future<String?> read() => _storage.read(key: _key);

  @override
  Future<void> save(String data) => _storage.write(key: _key, value: data);
}
