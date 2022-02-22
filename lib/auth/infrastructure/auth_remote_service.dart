import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/infrastructure/dtos/user_dto.dart';

import '../../core/infrastructure/extinstions/dio_no_internet.dart';
import 'keys.dart';

class AuthRemoteService {
  final Dio _dio;
  AuthRemoteService(this._dio);

  final _authorizationEndpoint =
      Uri.parse('https://gitlab.com/oauth/authorize');

  final _tokenEndpoint = Uri.parse('https://gitlab.com/oauth/token');

  static final redirectedUrl = Uri.parse('https://localhost:3000/callback');

  final _revokeEndpoint = Uri.parse('https://gitlab.com/oauth/revoke');

  final _scopes = ['read_user', 'read_repository'];

  final _usernameUri = Uri.parse('https://gitlab.com/api/v4/user');

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
  Uri getAuthUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectedUrl, scopes: _scopes);
  }

  /// Processes the query parameters added to the redirected URL from the authorization server.
  ///
  /// Throws [FormatError] if [parameters] is invalid according to the OAuth2 spec or if the
  /// authorization server otherwise provides invalid responses.
  ///
  /// Throws [AuthorizationException] if the authorization fails.
  Future<Credentials> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryParams,
  ) async {
    final client = await grant.handleAuthorizationResponse(queryParams);
    return client.credentials;
  }

  /// Returns a new set of refreshed credentials.
  ///
  /// Throws an [AuthorizationException] if refreshing the credentials fails,
  /// or a [FormatError] if the authorization server returns invalid responses.
  Future<Credentials> refreshCredentials(
    Credentials oldCredentials,
  ) async {
    return oldCredentials.refresh(
      identifier: identifier,
      secret: secret,
    );
  }

  /// Performs a POST request to revoke [accessToken].
  ///
  /// Throws an [AuthorizationException] if revokeing did not succeeded.
  ///
  /// Note that access token will NOT be revoked if there's no internet connection.
  Future<void> signout(Credentials credentials) async {
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
        // Token revoked.
        return;
      } else {
        // Api service did not provide any status code other than 200 in the docs.
        throw AuthorizationException(
          response.statusCode.toString(),
          null,
          null,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnection) {
        // token did not revoked.
        // we still want the user to be able to signout even if there's no internet connection
        // so nothing to do here except the fact that the app won't crash now.
        return;
      } else {
        // Unexpected Error.
        // Let it crash the app.
        rethrow;
      }
    }
  }

  /// Can throw [AuthorizationException].
  Future<Either<UserDTO, Unit>> getUserInfo(Credentials credentials) async {
    try {
      final response = await _dio.getUri(
        _usernameUri,
        options: Options(
          headers: {'Authorization': 'bearer ${credentials.accessToken}'},
        ),
      );
      if (response.statusCode == 200) {
        final dto = UserDTO.fromJson(response.data as Map<String, dynamic>);
        return left(dto);
      } else {
        throw AuthorizationException(
          response.statusCode.toString(),
          response.statusMessage,
          null,
        );
      }
    } on DioError catch (e) {
      if (e.isNoConnection) {
        return right(unit);
      } else {
        rethrow;
      }
    }
  }
}
