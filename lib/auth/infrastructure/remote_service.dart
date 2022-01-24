import 'package:dartz/dartz.dart';
import 'package:oauth2/oauth2.dart';

import '../domain/auth_failure.dart';
import 'keys.dart';

class RemoteService {
  final authorizationEndpoint = Uri.parse('https://gitlab.com/oauth/authorize');
  final tokenEndpoint = Uri.parse('https://gitlab.com/oauth/token');
  final redirectedUrl = Uri.parse('https://localhost:3000/callback');
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
}
