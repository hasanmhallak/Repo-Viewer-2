import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';

import '../domain/entities/auth_failure.dart';
import '../domain/entities/user.dart';
import 'auth_local_service.dart';
import 'auth_remote_service.dart';
import 'type_defs/type_defs.dart';

class AuthRepository {
  final AuthLocalService _localService;
  final AuthRemoteService _remoteService;
  AuthRepository(this._localService, this._remoteService);

  /// Clears user info form local service.
  ///
  /// Can throw [PlatformException].
  Future<void> _clearData() async {
    await _localService.deleteCredentials();
    await _localService.deleteUser();
  }

  /// Returns a new set of refreshed credentials.
  Future<Either<AuthFailure, Credentials>> _refreshCredentials(
    Credentials oldCredentials,
  ) async {
    try {
      //
      if (oldCredentials.isExpired && oldCredentials.canRefresh) {
        final newCredentials =
            await _remoteService.refreshCredentials(oldCredentials);

        await _localService.saveCredentials(newCredentials);
        return right(newCredentials);
        //
      } else if (oldCredentials.isExpired && !oldCredentials.canRefresh) {
        //
        return left(
          const AuthFailure.server("Credentials can't be refreshed."),
        );
        //
      } else {
        //
        return right(oldCredentials);
        //
      }
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

  /// Returns a set of updated [Credentials].
  Future<Either<AuthFailure, Credentials>> getOrUpdateCredentials(
    Credentials? cachedCredentials,
  ) async {
    try {
      if (cachedCredentials == null) {
        //
        final credentials = await _localService.readCredentials();
        //
        if (credentials == null) {
          //
          return left(
            const AuthFailure.storage('No Credentials was found in storage.'),
          );
          //
        } else {
          //
          return _refreshCredentials(credentials);
          //
        }
      } else {
        //
        return _refreshCredentials(cachedCredentials);
        //
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
      await _localService.saveCredentials(credentials);
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

  /// Note that access token will NOT be revoked if there's no internet connection.
  Future<Either<AuthFailure, Unit>> signout(
    Credentials? cachedCredentials,
  ) async {
    Future<void> revokeAndClearCredentials(Credentials credentials) async {
      await _clearData();
      await _remoteService.signout(credentials);
    }

    try {
      if (cachedCredentials == null) {
        //
        final credentials = await _localService.readCredentials();
        if (credentials == null) {
          return left(
            const AuthFailure.storage('No Credentials was found in storage.'),
          );
        } else {
          revokeAndClearCredentials(credentials);
          return right(unit);
        }
        //
      } else {
        //
        revokeAndClearCredentials(cachedCredentials);
        return right(unit);
        //
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

  Future<Either<AuthFailure, User>> getOrUpdateUserInfo(
    Credentials credentials,
  ) async {
    // TODO: implement ETag.
    try {
      final dto = await _localService.readUser();
      if (dto != null) {
        return right(User.fromDTO(dto));
      } else {
        final userInfoOrUnit = await _remoteService.getUserInfo(credentials);
        return userInfoOrUnit.fold(
          (userInfo) async {
            await _localService.saveUser(userInfo);

            return right(User.fromDTO(userInfo));
          },
          (unit) {
            return left(const AuthFailure.server('No internet connection.'));
          },
        );
      }
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException catch (e) {
      return left(
        AuthFailure.storage('${e.code}: ${e.details}'),
      );
    }
  }
}
