import 'dart:convert';

import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/infrastructure/database/secure_database.dart';
import 'package:repo_viewer/auth/infrastructure/dtos/user_dto.dart';

class AuthLocalService {
  final SecureDatabase _database;

  AuthLocalService(this._database);

  /// Encrypts and saves [Credentials] in local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> saveCredentials(Credentials credentials) async {
    await _database.saveCredentials(credentials.toJson());
  }

  /// Decrypt and returns [Credentials] or `null` if [Credentials] is not in the storage.
  ///
  /// Can throw [PlatformException].
  Future<Credentials?> readCredentials() async {
    final credentialsJson = await _database.readCredentials();
    if (credentialsJson != null) {
      return Credentials.fromJson(credentialsJson);
    } else {
      return null;
    }
  }

  /// Clears [Credentials] from local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> deleteCredentials() async {
    await _database.deleteCredentials();
  }

  /// Encrypts and saves `UserDTO` in local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> saveUser(UserDTO user) async {
    final encodedUser = jsonEncode(user.toJson());
    await _database.saveUser(encodedUser);
  }

  /// Decrypt and returns user or `null` if user is not in the storage.
  ///
  /// Can throw [PlatformException].
  Future<UserDTO?> readUser() async {
    final encodedUser = await _database.readUser();
    if (encodedUser == null) {
      return null;
    } else {
      final decodedUser = json.decode(encodedUser);
      return UserDTO.fromJson(decodedUser as Map<String, dynamic>);
    }
  }

  /// Clears user from local storage.
  ///
  /// Can throw [PlatformException].
  Future<void> deleteUser() async {
    await _database.deleteUser();
  }
}
