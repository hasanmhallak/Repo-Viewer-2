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

  /// Encrypts and saves `username` in local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> saveUsername(String username);

  /// Decrypt and returns `username` or `null` if `username` is not in the storage.
  ///
  /// Can throw [PlatformException].
  Future<String?> readUsername();

  /// Clears `username` from local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> deleteUsername();
}
