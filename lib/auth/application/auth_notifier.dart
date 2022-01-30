import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repo_viewer/auth/infrastructure/type_defs/type_defs.dart';

import '../domain/auth_repository.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  AuthNotifier(this._repository) : super(const AuthState.initial());

  /// Updates the `state` with user's status.
  Future<void> checkAndUpdateAuthState() async {
    final isSignedIn = await _repository.isSignedIn;
    state = isSignedIn
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  /// Signs the user in and updates the `state`.
  Future<void> signin(AuthHandler handler) async {
    final failureOrSuccess = await _repository.signin(
      (authUri) async => handler(authUri),
    );
    state = failureOrSuccess.fold(
      (failure) => AuthState.failure(failure),
      (success) {
        return const AuthState.authenticated();
      },
    );
  }

  /// Signs the user out and updates the `state`.
  Future<void> signout() async {
    final failureOrSuccess = await _repository.signout();
    state = failureOrSuccess.fold(
      (failure) => AuthState.failure(failure),
      (r) => const AuthState.unauthenticated(),
    );
  }
}
