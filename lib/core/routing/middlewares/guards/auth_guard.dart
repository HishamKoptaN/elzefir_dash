import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/auth/auth/present/blocs/auth_bloc/auth_bloc.dart';
import '../../../di/dependency_injection.dart';
import 'route_guard.dart';

class AuthGuard implements RouteGuard {
  @override
  String? redirect(BuildContext context, GoRouterState state) {
    return getIt<AuthBloc>().state.maybeWhen(
      init: () {
        return '/sign-in';
      },
      authenticated: () {
        return null;
      },
      unauthenticated: () {
        return '/sign-in';
      },
      orElse: () {
        return '/sign-in';
      },
    );
  }
}
