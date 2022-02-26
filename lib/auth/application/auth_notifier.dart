import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oauth2/oauth2.dart';

import '../domain/entities/auth_failure.dart';
import '../domain/entities/user.dart';
import '../infrastructure/auth_repository.dart';
import '../infrastructure/type_defs/type_defs.dart';
import 'auth_state.dart';
import 'notifier_interface.dart';

class AuthNotifier extends StateNotifier<AuthState> with Notifier {
  final AuthRepository _repository;
  AuthNotifier(this._repository) : super(const AuthState.initial());

  Credentials? _credentials;
  User? _user;

  void _handleFailure(AuthFailure failure) {
    // Show a message.
    state = AuthState.failure(failure);
    state = const AuthState.unauthenticated();
    _credentials = null;
    _user = null;
  }

  /// Updates the `state` with user's status.
  Future<void> checkAndUpdateAuthState() async {
    await _getUserInfoAndUpdateStateIfFailed();
  }

  /// Signs the user in and updates the `state`.
  Future<void> signin(AuthHandler handler) async {
    final failureOrSuccess = await _repository.signin(
      (authUri) async => handler(authUri),
    );
    state = failureOrSuccess.fold(
      (failure) => AuthState.failure(failure),
      (credentials) {
        _credentials = credentials;
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

  Future<void> _getCredentialsAndUpdateState() async {
    final credentialsOrFailure =
        await _repository.getOrUpdateCredentials(_credentials);
    return credentialsOrFailure.fold(
      (failure) {
        _handleFailure(failure);
      },
      (credentials) {
        state = const AuthState.authenticated();
        _credentials = credentials;
      },
    );
  }

  /// Refreshes [Credentials] & [User].
  Future<void> _getUserInfoAndUpdateStateIfFailed() async {
    await _getCredentialsAndUpdateState();
    if (_credentials == null) {
      return;
    } else {
      final userOrFailure =
          await _repository.getOrUpdateUserInfo(_credentials!);
      return userOrFailure.fold(
        (failure) {
          _handleFailure(failure);
        },
        (user) {
          _user = user;
        },
      );
    }
  }

  @override
  Future<Credentials?> get credentials async {
    await checkAndUpdateAuthState();
    return _credentials;
  }

  @override
  Future<User?> get user async {
    await checkAndUpdateAuthState();
    return _user;
  }
}
