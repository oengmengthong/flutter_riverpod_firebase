import 'package:flutter/widgets.dart';

import 'package:auto_route/auto_route.dart';

import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod_firebase/src/routers/app_router.dart';
import 'package:flutter_riverpod_firebase/src/routers/guards.dart';

import '../../data/entites/permission_role.dart';


@module
abstract class RoutesModule {
  @singleton
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
      RedirectRoute(
        path: '*',
        redirectTo: Navigator.defaultRouteName,
      )
    ];
  }

  @singleton
  RoleGuard get roleGuard {
    return RoleGuard(
      policies: {
        TodoRoute.name: [
          PermissionRole.user,
          PermissionRole.guest,
        ],
      },
    );
  }
}
