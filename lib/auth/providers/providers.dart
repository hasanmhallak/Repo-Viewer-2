import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer/auth/infrastructure/dio_interceptor.dart';

import '../application/auth_notifier.dart';
import '../application/auth_state.dart';
import '../infrastructure/auth_local_service.dart';
import '../infrastructure/auth_remote_service.dart';
import '../infrastructure/auth_repository.dart';
import '../infrastructure/database/secure_storage.dart';

final authRepository = Provider<AuthRepository>((ref) {
  final _dio = Dio();
  const _secureDatabase = SecureStorage();
  final _localService = AuthLocalService(_secureDatabase);
  final _remoteService = AuthRemoteService(_dio);
  return AuthRepository(_localService, _remoteService);
});

final authNotifier = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(authRepository),
  ),
);

final authInterceptorProvider = Provider<AuthInterceptor>(
  (ref) => AuthInterceptor(
    ref.watch(authNotifier.notifier),
  ),
);

/// Dio instance with [Interceptor] setup to add [Credentials] & [Username]
/// to every request.
final dioWithStarredInterceptor = Provider<Dio>(
  (ref) => Dio()..interceptors.add(ref.watch(authInterceptorProvider)),
);
