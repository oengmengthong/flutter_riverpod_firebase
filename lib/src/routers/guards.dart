import 'package:flutter_riverpod_firebase/src/shared/utils/logger.dart';
import 'package:get_it/get_it.dart';

import '../data/entites/permission_role.dart';
import '../feature/auth/view_model/auth_riverpod.dart';

abstract class Guard {
  Future<bool> resolve(String policy);
}

class RoleGuard extends Guard {
  RoleGuard({
    required this.policies,
    required this.authController,
  });

  final Map<String, List<PermissionRole>> policies;
  final AuthController authController;

  @override
  Future<bool> resolve(String policy) async {
    final allowedRoles = policies[policy] ?? const [];
    final userRole = authController.state.userRole;
    logger.d('User role: $userRole');
    return allowedRoles.contains(userRole);
  }
}
