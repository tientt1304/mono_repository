import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../authentication.dart';
import 'package:camera/camera.dart' as camera;

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Screen')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        RedirectRoute(path: '/', redirectTo: '/login'),
        AutoRoute(
          path: '/login',
          page: Login.page,
        ),
        AutoRoute(
          path: '/verify_pin_code',
          page: VerifyPinCode.page,
        ),
        ...camera.appRouter.routes,
      ];
}

final appRouter = AppRouter();

extension RouterUtils on AppRouter {
  /// push if the current route is not equal to [route],
  /// back to [route] if exists in [appRouter].[stack]
  Future<dynamic> pushToStack(PageRouteInfo route) async {
    if (appRouter.stack.map((e) => e.name).contains(route.routeName)) {
      // check if route exists in stack
      // back to route instead of duplicate same route
      return appRouter.popUntilRouteWithName(route.routeName);
    } else if (appRouter.current.name != route.routeName) {
      // push route
      return appRouter.push(route);
    }
  }
}
