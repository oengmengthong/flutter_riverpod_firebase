import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase/src/data/entites/permission_role.dart';
import 'package:flutter_riverpod_firebase/src/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod_firebase/src/data/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return GetIt.I<AuthController>();
});

class AuthState {
  AuthState({
    this.userRole = PermissionRole.guest,
    this.loading = false,
    this.isAuthenticated = false,
    this.error = '',
  });
  final bool loading;
  final String error;
  final bool isAuthenticated;
  final PermissionRole userRole;
}

@injectable
class AuthController extends StateNotifier<AuthState> {
  AuthController(this.authRepository, this.userRepository) : super(AuthState());

  final AuthRepository authRepository;
  final UserRepository userRepository;

  // check if user is logged in
  Future<void> checkAuthState() async {
    try {
      final user = userRepository.getCurrentUser();
      if (user != null) {
        state = AuthState(
          userRole: PermissionRole.user,
          isAuthenticated: true,
        );
      } else {
        state = AuthState();
      }
    } catch (e) {
      state = AuthState();
    }
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await authRepository.signInWithEmailPassword(email, password);
      state = AuthState(
        userRole: PermissionRole.user,
        isAuthenticated: true,
      );
    } catch (e) {
      state = AuthState();
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await authRepository.signUpWithEmailPassword(email, password);
      state = AuthState(
        userRole: PermissionRole.user,
        isAuthenticated: true,
      );
    } catch (e) {
      state = AuthState();
    }
  }

  Future<void> logOut() async {
    try {
      await authRepository.signOut();
      state = AuthState();
    } catch (e) {
      state = AuthState(
        isAuthenticated: true,
        userRole: PermissionRole.user,
      );
    }
  }
}
