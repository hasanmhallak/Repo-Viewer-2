/// Handles the proccess of redirecting the resource owner
/// to the authorization URL and getting back the URL that
/// holds the code in the [queryParameters] in which will
/// be exchanged for an accessToken.
///
/// This [queryParameters] should be passed to `handleAuthorizationResponse` method for
/// handling the exchange proccess.
typedef AuthHandler = Future<Uri> Function(Uri authUri);
