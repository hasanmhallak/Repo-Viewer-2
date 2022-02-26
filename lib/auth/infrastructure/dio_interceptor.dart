import 'package:dio/dio.dart';

import '../application/notifier_interface.dart';

class AuthInterceptor extends Interceptor {
  final Notifier _notifier;

  AuthInterceptor(this._notifier);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final credentials = await _notifier.credentials;
    final user = await _notifier.user;
    if (credentials != null && user != null) {
      final modifiedOptions = options
        ..headers.addAll(
          {'Authorization': 'bearer ${credentials.accessToken}'},
        )
        ..path.replaceFirst(RegExp('user_name'), user.username);
      handler.next(modifiedOptions);
    } else {
      return;
    }
  }
}
