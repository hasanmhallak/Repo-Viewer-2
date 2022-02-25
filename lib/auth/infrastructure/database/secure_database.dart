abstract class SecureDatabase {
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

  /// Encrypts and saves user in local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> saveUser(String user);

  /// Decrypt and returns user or `null` if user is not in the storage.
  ///
  /// Can throw [PlatformException].
  Future<String?> readUser();

  /// Clears user from local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> deleteUser();
}
