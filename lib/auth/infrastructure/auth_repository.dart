import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';

import '../domain/entities/auth_failure.dart';
import 'auth_local_service.dart';
import 'auth_remote_service.dart';
import 'type_defs/type_defs.dart';

class AuthRepository {
  final AuthLocalService _localService;
  final AuthRemoteService _remoteService;
  AuthRepository(this._localService, this._remoteService);

  /// Clears credentials form local service.
  ///
  /// Can throw [PlatformException].
  Future<void> _clearCredentials() async {
    await _localService.delete();
  }

  /// Saves credentials to local service.
  ///
  /// Can throw [PlatformException].
  Future<void> _saveCredentials(Credentials credentials) async {
    await _localService.save(credentials.toJson());
  }

  /// Returns [Credentials] or [AuthFailure].
  Future<Either<AuthFailure, Credentials>> getCredentials() async {
    try {
      final json = await _localService.read();
      if (json == null) {
        return left(
          const AuthFailure.storage('No Credentials was found in storage.'),
        );
      } else {
        final credentials = Credentials.fromJson(json);
        if (credentials.isExpired && credentials.canRefresh) {
          final refreshedCredentials = await _refreshCredentials(credentials);
          return refreshedCredentials.fold(
            (authFailure) => left(authFailure),
            (credentials) async {
              await _saveCredentials(credentials);
              return right(credentials);
            },
          );
        } else {
          return right(credentials);
        }
      }
    } on PlatformException catch (e) {
      return left(
        AuthFailure.storage('${e.code}: ${e.message}'),
      );
    }
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
  Future<Either<AuthFailure, Credentials>> signin(
    AuthHandler authHandler,
  ) async {
    final grant = _remoteService.getGrant();
    final authUri = _remoteService.getAuthUrl(grant);
    final authorizedUri = await authHandler(authUri);
    try {
      final credentials = await _remoteService.handleAuthorizationResponse(
        grant,
        authorizedUri.queryParameters,
      );
      await _saveCredentials(credentials);
      grant.close();
      return right(credentials);
    } on AuthorizationException catch (e) {
      return left(
        AuthFailure.server('${e.error}: ${e.description}'),
      );
    } on PlatformException catch (e) {
      return left(
        AuthFailure.storage('${e.code}: ${e.message}'),
      );
    }
  }

  /// Returns a new set of refreshed credentials.
  Future<Either<AuthFailure, Credentials>> _refreshCredentials(
    Credentials oldCredentials,
  ) async {
    try {
      final newCredentials =
          await _remoteService.refreshCredentials(oldCredentials);
      await _saveCredentials(newCredentials);

      return right(newCredentials);
    } on AuthorizationException catch (e) {
      return left(
        AuthFailure.server('${e.error}: ${e.description}'),
      );
    } on FormatException catch (e) {
      return left(
        AuthFailure.server(e.message),
      );
    } on PlatformException catch (e) {
      return left(
        AuthFailure.storage('${e.code}: ${e.details}'),
      );
    }
  }

  /// Note that access token will NOT be revoked if there's no internet connection.
  Future<Either<AuthFailure, Unit>> signout(
    Credentials? cachedCredentials,
  ) async {
    Future<void> revokeAndClearCredentials(Credentials credentials) async {
      await _clearCredentials();
      await _remoteService.signout(credentials);
    }

    try {
      if (cachedCredentials == null) {
        final json = await _localService.read();

        final credentials = Credentials.fromJson(json!);
        revokeAndClearCredentials(credentials);
        return right(unit);
      } else {
        revokeAndClearCredentials(cachedCredentials);
        return right(unit);
      }
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
}
