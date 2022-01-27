/// Handles the proccess of redirecting the resource owner
/// to the authorization URL and getting back the URL that
/// holds the code in the [queryParameters] in which will
/// be exchanged for an accessToken.
typedef AuthHandler = Future<Uri> Function(Uri authUri);
