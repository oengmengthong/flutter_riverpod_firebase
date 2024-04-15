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
  AuthState(
    this.isAuthenticated,
    this.userRole,
  );
  final bool isAuthenticated;
  final PermissionRole userRole;
}

@injectable
class AuthController extends StateNotifier<AuthState> {
  AuthController(this.authRepository, this.userRepository)
      : super(AuthState(false, PermissionRole.guest));

  final AuthRepository authRepository;
  final UserRepository userRepository;

  // check if user is logged in
  Future<void> checkAuthState() async {
    try {
      final user = userRepository.getCurrentUser();
      if (user != null) {
        state = AuthState(true, PermissionRole.user);
      } else {
        state = AuthState(false, PermissionRole.guest);
      }
    } catch (e) {
      state = AuthState(false, PermissionRole.guest);
    }
  }

  Future<void> logIn() async {
    try {
      await authRepository.signInAnonymously();
      state = AuthState(true, PermissionRole.user);
    } catch (e) {
      state = AuthState(false, PermissionRole.guest);
    }
  }

  Future<void> logOut() async {
    try {
      await authRepository.signOut();
      state = AuthState(false, PermissionRole.guest);
    } catch (e) {
      state = AuthState(true, PermissionRole.guest);
    }
  }
}
