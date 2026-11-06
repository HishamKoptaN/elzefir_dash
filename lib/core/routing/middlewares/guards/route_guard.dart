import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract interface class RouteGuard {
  String? redirect(BuildContext context, GoRouterState state);
}
