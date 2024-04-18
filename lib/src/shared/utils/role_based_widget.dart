import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_firebase/src/data/entites/permission_role.dart';
import 'package:flutter_riverpod_firebase/src/feature/auth/view_model/auth_riverpod.dart';

class RoleBasedWidget extends ConsumerWidget {
  const RoleBasedWidget({
    required this.allowedRoles,
    required this.child,
    super.key,
  });

  final List<PermissionRole> allowedRoles;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    return allowedRoles.contains(authState.userRole)
        ? child
        : const SizedBox.shrink();
  }
}
