import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod_firebase/src/data/entites/permission_role.dart';
import 'package:flutter_riverpod_firebase/src/feature/auth/view_model/auth_model.dart';
import 'package:flutter_riverpod_firebase/src/routers/app_router.dart';
import 'package:flutter_riverpod_firebase/src/routers/guards.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RoutesModule {
  @lazySingleton
  AppRouter appRouter(RoleGuard roleGuard, List<AutoRoute> routes) {
    return AppRouter(roleGuard: roleGuard, routes: routes);
  }

  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: TodoRoute.page,
        initial: true,
        path: Navigator.defaultRouteName,
      ),
      AutoRoute(
        page: LoginRoute.page,
      ),
      AutoRoute(page: RegisterRoute.page),
      RedirectRoute(
        path: '*',
        redirectTo: Navigator.defaultRouteName,
      )
    ];
  }

  @lazySingleton
  RoleGuard get roleGuard {
    return RoleGuard(
      authController: GetIt.I<AuthController>(),
      policies: {
        LoginRoute.name: [
          PermissionRole.guest,
        ],
        RegisterRoute.name: [
          PermissionRole.guest,
        ],
        TodoRoute.name: [
          PermissionRole.user,
        ],
      },
    );
  }
}
