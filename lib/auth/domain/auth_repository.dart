import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';

import '../infrastructure/auth_local_service.dart';
import '../infrastructure/auth_remote_service.dart';
import '../infrastructure/type_defs/type_defs.dart';
import 'entities/auth_failure.dart';

class AuthRepository {
  final AuthLocalService _localService;
  final AuthRemoteService _remoteService;

  AuthRepository(this._localService, this._remoteService);

  Credentials? _cachedCredentials;

  /// Returns [Credentials] from cache or local storage.
  ///
  /// Refreshes [Credentials] if needed.
  Future<Credentials?> getCredentials() async {
    if (_cachedCredentials != null) {
      return _cachedCredentials;
    } else {
      try {
        final json = await _localService.read();
        if (json == null) return null;
        final credentials = Credentials.fromJson(json);
        if (credentials.isExpired && credentials.canRefresh) {
          final refreshedCredentials = await refreshCredentials(credentials);
          refreshedCredentials.fold(
            (authFailure) => null,
            (credentials) {
              _cachedCredentials = credentials;
              return credentials;
            },
          );
        }
      } on PlatformException {
        return null;
      }
    }
  }

  /// Returns `true` if the user is signed in.
  Future<bool> get isSignedIn {
    return getCredentials().then((credentials) => credentials != null);
  }

  /// Starts the sign-in process.
  ///
  /// [authHandler] is a function should be passed to handles the proccess
  /// of redirecting the resource owner
  /// to the authorization URL and getting back the URL that
  /// holds the code in the [queryParameters] in which will
  /// be exchanged for an accessToken.
  ///
  /// Returns [Unit] if the process succeeded.
  Future<Either<AuthFailure, Unit>> signin(AuthHandler authHandler) async {
    final grant = _remoteService.getGrant();
    final authUri = _remoteService.getAuthUrl(grant);
    final authorizedUri = await authHandler(authUri);
    try {
      final credentials = await _remoteService.handleAuthorizationResponse(
        grant,
        authorizedUri.queryParameters,
      );
      await _localService.save(credentials.toJson());
      return right(unit);
    } on AuthorizationException catch (e) {
      return left(
        AuthFailure.server('${e.error}: ${e.description}'),
      );
    } on PlatformException catch (e) {
      return left(
        AuthFailure.storage('${e.code}: ${e.details}'),
      );
    }
  }

  /// Returns a new set of refreshed credentials.
  Future<Either<AuthFailure, Credentials>> refreshCredentials(
    Credentials oldCredentials,
  ) async {
    try {
      final newCredentials =
          await _remoteService.refreshCredentials(oldCredentials);
      return right(newCredentials);
    } on AuthorizationException catch (e) {
      return left(
        AuthFailure.server('${e.error}: ${e.description}'),
      );
    } on FormatException catch (e) {
      return left(
        AuthFailure.server(e.message),
      );
    }
  }

  /// Note that access token will NOT be revoked if there's no internet connection.
  Future<Either<AuthFailure, Unit>> signout(Credentials credentials) async {
    try {
      await _remoteService.signout(credentials);
      return right(unit);
    } on AuthorizationException catch (e) {
      return left(
        AuthFailure.server('${e.error}: ${e.description}'),
      );
    }
  }
}
