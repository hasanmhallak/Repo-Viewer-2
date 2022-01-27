import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_notifier.dart';
import 'package:repo_viewer/auth/application/auth_state.dart';
import 'package:repo_viewer/auth/domain/auth_repository.dart';
import 'package:repo_viewer/auth/infrastructure/auth_local_service.dart';
import 'package:repo_viewer/auth/infrastructure/auth_remote_service.dart';

final authRepository = Provider<AuthRepository>((ref) {
  final _dio = Dio();
  const _localService = AuthLocalService();
  final _remoteService = AuthRemoteService(_dio);
  return AuthRepository(_localService, _remoteService);
});

final authNotifier = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(authRepository),
  ),
);
