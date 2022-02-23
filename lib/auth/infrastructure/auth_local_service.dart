abstract class AuthLocalService {
  /// Encrypts and saves [Credentials] in local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> saveCredentials(String credentials);

  /// Decrypt and returns [Credentials] or `null` if [Credentials] is not in the storage.
  ///
  /// Can throw [PlatformException].
  Future<String?> readCredentials();

  /// Clears [Credentials] from local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> deleteCredentials();

  /// Encrypts and saves `UserDTO` in local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> saveUser(Map<String, dynamic> user);

  /// Decrypt and returns `UserDTO` or `null` if `UserDTO` is not in the storage.
  ///
  /// Can throw [PlatformException].
  Future<Map<String, dynamic>?> readUser();

  /// Clears `UserDTO` from local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> deleteUser();
}
