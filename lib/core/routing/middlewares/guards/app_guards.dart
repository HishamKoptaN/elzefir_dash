import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_guard.dart';

class AppGuards {
  static final authenticated = [AuthGuard()];
  static final orders = [AuthGuard()];
  static final templates = [AuthGuard()];
  static final invoices = [AuthGuard()];

  static String? authenticatedRedirect(
    BuildContext context,
    GoRouterState state,
  ) {
    return authenticated.first.redirect(context, state);
  }
}
