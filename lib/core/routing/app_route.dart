import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'middlewares/guards/route_guard.dart';

GoRoute appRoute({
  required String name,
  required String path,
  required Widget Function(BuildContext, GoRouterState) builder,
  List<RouteGuard> guards = const [],
  List<RouteBase> routes = const [],
}) {
  return GoRoute(
    path: path,
    name: name,
    builder: builder,
    routes: routes,
    redirect: (context, state) {
      for (final guard in guards) {
        final result = guard.redirect(context, state);
        if (result != null) {
          return result;
        }
      }
      return null;
    },
  );
}
