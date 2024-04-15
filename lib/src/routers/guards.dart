import 'package:get_it/get_it.dart';

import '../data/entites/permission_role.dart';
import '../feature/auth/cubit/auth_cubit.dart';

abstract class Guard {
  Future<bool> resolve(String policy);
}

class RoleGuard extends Guard {
  RoleGuard({required this.policies});

  final Map<String, List<PermissionRole>> policies;

  @override
  Future<bool> resolve(String policy) async {
    final allowedRoles = policies[policy] ?? const [];
    final userRole = GetIt.I<AuthCubit>().state.userRole;
    return allowedRoles.contains(userRole);
  }
}
