import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/entites/permission_role.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/user_repository.dart';

class AuthState {
  AuthState(
    this.isAuthenticated,
    this.userRole,
  );
  final bool isAuthenticated;
  final PermissionRole userRole;
}

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository,this.userRepository) : super(AuthState(false, PermissionRole.guest));

  final AuthRepository authRepository;
  final UserRepository userRepository;

  // check if user is logged in
  Future<void> checkAuthState() async {
    try {
      final user = userRepository.getCurrentUser();
      if(user != null) {
        emit(AuthState(true, PermissionRole.user));
      } else {
        emit(AuthState(false, PermissionRole.guest));
      }
    } catch (e) {
      emit(AuthState(false, PermissionRole.guest));
    }
  }

  Future<void> logIn() async {
    try {
      await authRepository.signInAnonymously();
      emit(AuthState(true, PermissionRole.user));
    } catch (e) {
      emit(AuthState(false, PermissionRole.guest));
    }
  }

  Future<void> logOut() async {
    try {
      await authRepository.signOut();
      emit(AuthState(false, PermissionRole.guest));
    } catch (e) {
      emit(AuthState(true, PermissionRole.guest));
    }
  }
}
