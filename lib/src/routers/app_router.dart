import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod_firebase/src/feature/counter/counter.dart';
import '../feature/auth/view/login_page.dart';
import 'guards.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter({
    required this.roleGuard,
    required this.routes,
  });

  final RoleGuard roleGuard;

  @override
  final List<AutoRoute> routes;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (await roleGuard.resolve(resolver.route.name)) {
      resolver.next();
    } else {
      await resolver.redirect(const CounterRoute());
    }
  }
}
