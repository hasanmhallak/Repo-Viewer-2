import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/auth_notifier.dart';
import '../application/auth_state.dart';
import '../infrastructure/auth_remote_service.dart';
import '../infrastructure/auth_repository.dart';
import '../infrastructure/database/secure_storage.dart';

final authRepository = Provider<AuthRepository>((ref) {
  final _dio = Dio();
  const _localService = SecureStorage();
  final _remoteService = AuthRemoteService(_dio);
  return AuthRepository(_localService, _remoteService);
});

final authNotifier = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(authRepository),
  ),
);
