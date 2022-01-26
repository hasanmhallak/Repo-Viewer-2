import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:oauth2/oauth2.dart';

import '../../core/infrastructure/extinstions/dio_no_internet.dart';
import '../domain/auth_failure.dart';
import 'keys.dart';

class AuthRemoteService {
  final Dio _dio;
  AuthRemoteService(this._dio);

  final _authorizationEndpoint =
      Uri.parse('https://gitlab.com/oauth/authorize');
  final _tokenEndpoint = Uri.parse('https://gitlab.com/oauth/token');
  final _redirectedUrl = Uri.parse('https://localhost:3000/callback');
  final _revokeEndpoint = Uri.parse('https://gitlab.com/oauth/revoke');
  final _scopes = ['read_user', 'read_repository'];

  /// Creates a new grant which uses HTTP Basic authentication as defined in RFC 2617.
  ///
  /// This grant well then be used during the oAuth2 authentication proccess.
  ///
  /// A [codeVerifier] will be randomly generated which meet the requirements specified in RFC 7636.
  AuthorizationCodeGrant getGrant() {
    return AuthorizationCodeGrant(
      identifier,
      _authorizationEndpoint,
      _tokenEndpoint,
      secret: secret,
    );
  }

  /// Returns the URL to which the resource owner should be redirected to authorize this client.
  ///
  /// After the authorization of this client, it will be redirected by the server to
  /// a URL that holds the code in the [queryParameters] in which will be exchanged for
  /// an accessToken.
  ///
  /// This [queryParameters] should be passed to `handleAuthorizationResponse` method for
  /// handling the exchange proccess.
  Uri getAuthUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(_redirectedUrl, scopes: _scopes);
  }

  /// Processes the query parameters added to the redirected URL from the authorization server.
  ///
  /// Returns [AuthFailure] if [queryParams] is invalid according to the OAuth2 spec or if the
  /// authorization server otherwise provides invalid responses.
  Future<Either<AuthFailure, Credentials>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryParams,
  ) async {
    try {
      final client = await grant.handleAuthorizationResponse(queryParams);

      return right(client.credentials);
    } on FormatException catch (e) {
      return left(AuthFailure.server(e.message));
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    }
  }

  /// Returns a new set of refreshed credentials.
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

  /// Performs a POST request to revoke [accessToken].
  ///
  /// Returns `Unit` if revocation was successful.
  ///
  /// Note that access token will NOT be revoked if there's no internet connection.
  Future<Either<AuthFailure, Unit>> signout(Credentials credentials) async {
    try {
      final response = await _dio.post(
        _revokeEndpoint.toString(),
        queryParameters: {
          'client_id': identifier,
          'client_secret': secret,
          'token': credentials.accessToken
        },
      );
      if (response.statusCode == 200) {
        return right(unit);
      } else {
        return left(
          AuthFailure.server(
            '${response.statusCode}: ${response.statusMessage}',
          ),
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnection) {
        return left(const AuthFailure.server('No internet connection.'));
      } else {
        // Unexpected Error.
        rethrow;
      }
    }
  }
}
