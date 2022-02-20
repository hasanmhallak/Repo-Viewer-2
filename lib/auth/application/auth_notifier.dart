import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2/oauth2.dart';

import '../infrastructure/auth_repository.dart';
import '../infrastructure/type_defs/type_defs.dart';
import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  AuthNotifier(this._repository) : super(const AuthState.initial());

  Credentials? _credentials;

  /// Updates the `state` with user's status.
  Future<Either<Credentials, Unit>> checkAndUpdateAuthState() async {
    final credentialsOrFailure =
        await _repository.getOrUpdateCredentials(_credentials);
    state = credentialsOrFailure.fold(
      (l) => const AuthState.unauthenticated(),
      (r) {
        _credentials = r;
        return const AuthState.authenticated();
      },
    );
    return credentialsOrFailure.fold(
      (l) => right(unit),
      (credentials) => left(credentials),
    );
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
    final failureOrSuccess = await _repository.signout(_credentials);
    state = failureOrSuccess.fold(
      (l) => const AuthState.unauthenticated(),
      (r) => const AuthState.authenticated(),
    );
  }
}
