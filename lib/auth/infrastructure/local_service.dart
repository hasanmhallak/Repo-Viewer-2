import 'credentials_storage/secure_storage.dart';

abstract class LocalService {
  const factory LocalService() = SecureStorage;

  /// Encrypts and saves data in local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> save(String data);

  /// Decrypt and returns data or `null` if data is not in the storage.
  ///
  /// Can throw [PlatformException].
  Future<String?> read();

  /// Clears local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> delete();
}
