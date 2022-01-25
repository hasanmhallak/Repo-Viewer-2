import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:oauth2/oauth2.dart';

import '../domain/auth_failure.dart';
import 'keys.dart';

class RemoteService {
  final Dio _dio;
  RemoteService(this._dio);

  final authorizationEndpoint = Uri.parse('https://gitlab.com/oauth/authorize');
  final tokenEndpoint = Uri.parse('https://gitlab.com/oauth/token');
  final redirectedUrl = Uri.parse('https://localhost:3000/callback');
  final revokeEndpoint = Uri.parse('https://gitlab.com/oauth/revoke');
  final scopes = ['read_user', 'read_repository'];

  /// Creates a new grant.
  AuthorizationCodeGrant grant() {
    return AuthorizationCodeGrant(
      identifier,
      authorizationEndpoint,
      tokenEndpoint,
      secret: secret,
    );
  }

  /// Returns the URL to which the resource owner should be redirected to authorize this client.
  Uri getAuthUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectedUrl, scopes: scopes);
  }

  /// Returns [Credentials] or [AuthFailure].
  Future<Either<AuthFailure, Credentials>> getCredentials(
    AuthorizationCodeGrant grant,
    Map<String, String> parameters,
  ) async {
    try {
      final client = await grant.handleAuthorizationResponse(parameters);

      return right(client.credentials);
    } on FormatException catch (e) {
      return left(AuthFailure.server(e.message));
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    }
  }

  /// Refreshes and Returns [Credentials] or [AuthFailure].
  Future<Either<AuthFailure, Credentials>> refreshCredentials(
    Credentials oldCredentials,
  ) async {
    try {
      final refreshedCredentials = await oldCredentials.refresh(
        identifier: identifier,
        secret: secret,
      );
      return right(refreshedCredentials);
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on FormatException catch (e) {
      return left(AuthFailure.server(e.message));
    }
  }

  Future<Either<AuthFailure, Unit>> signout(Credentials credentials) async {
    try {
      final response = await _dio.post(
        revokeEndpoint.toString(),
        queryParameters: {
          'client_id': identifier,
          'client_secret': secret,
          'token': credentials.accessToken
        },
      );
    } on DioError {
      rethrow;
    }
  }
}
