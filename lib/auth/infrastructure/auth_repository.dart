import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/domain/entities/user.dart';
import 'package:repo_viewer/auth/infrastructure/dtos/user_dto.dart';

import '../domain/entities/auth_failure.dart';
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
  Future<void> _clearUserInfo() async {
    await _localService.deleteCredentials();
    await _localService.deleteUser();
  }

  /// Saves credentials to local service.
  ///
  /// Can throw [PlatformException].
  Future<void> _saveCredentials(Credentials credentials) async {
    await _localService.saveCredentials(credentials.toJson());
  }

  /// Saves user info to local service.
  ///
  /// Can throw [PlatformException].
  Future<void> _saveUserInfo(UserDTO dto) async {
    await _localService.saveUser(dto.toJson());
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
        await _saveCredentials(newCredentials);
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

  /// A shortcut to achieve DRY principal.
  Future<Either<AuthFailure, Credentials>> _refreshAndReturnCredentials(
    Credentials credentials,
  ) async {
    final refreshedCredentials = await _refreshCredentials(credentials);
    return refreshedCredentials.fold(
      (authFailure) => left(authFailure),
      (credentials) {
        return right(credentials);
      },
    );
  }

  /// Returns a set of updated [Credentials].
  Future<Either<AuthFailure, Credentials>> getOrUpdateCredentials(
    Credentials? cachedCredentials,
  ) async {
    try {
      if (cachedCredentials == null) {
        //
        final json = await _localService.readCredentials();
        //
        if (json == null) {
          //
          return left(
            const AuthFailure.storage('No Credentials was found in storage.'),
          );
          //
        } else {
          //
          final credentials = Credentials.fromJson(json);
          return _refreshAndReturnCredentials(credentials);
          //
        }
      } else {
        //
        return _refreshAndReturnCredentials(cachedCredentials);
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

  /// Note that access token will NOT be revoked if there's no internet connection.
  Future<Either<AuthFailure, Unit>> signout(
    Credentials? cachedCredentials,
  ) async {
    Future<void> revokeAndClearCredentials(Credentials credentials) async {
      await _clearUserInfo();
      await _remoteService.signout(credentials);
    }

    try {
      if (cachedCredentials == null) {
        //
        final json = await _localService.readCredentials();
        final credentials = Credentials.fromJson(json!);
        revokeAndClearCredentials(credentials);
        return right(unit);
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
      final json = await _localService.readUser();
      if (json != null) {
        final dto = UserDTO.fromJson(json);
        return right(User.fromDTO(dto));
      } else {
        final userInfoOrUnit = await _remoteService.getUserInfo(credentials);
        return userInfoOrUnit.fold(
          (userInfo) async {
            await _saveUserInfo(userInfo);

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
