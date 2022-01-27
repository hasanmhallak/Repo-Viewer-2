import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/infrastructure/auth_local_service.dart';
import 'package:repo_viewer/auth/infrastructure/auth_remote_service.dart';
import 'package:repo_viewer/auth/infrastructure/type_defs/type_defs.dart';

class AuthRepository {
  final AuthLocalService _localService;
  final AuthRemoteService _remoteService;

  AuthRepository(this._localService, this._remoteService);

  Credentials? _cachedCredentials;

  /// Returns [Credentials] from cache or local storage.
  Future<Credentials?> getCredentials() async {
    if (_cachedCredentials != null) {
      return _cachedCredentials;
    } else {
      try {
        final json = await _localService.read();
        if (json == null) return null;
        return Credentials.fromJson(json);
      } on PlatformException {
        return null;
      }
    }
  }

  /// Returns `true` if the user is signed in.
  Future<bool> get isSignedIn {
    return getCredentials().then((credentials) => credentials != null);
  }

  Future<void> signin(AuthHandler authHandler) async {
    final grant = _remoteService.getGrant();
    final authUri = _remoteService.getAuthUrl(grant);
    final authorizedUri = await authHandler(authUri);
  }
}
