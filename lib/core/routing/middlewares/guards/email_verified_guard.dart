import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_guard.dart';

class EmailVerifiedGuard implements RouteGuard {
  @override
  String? redirect(BuildContext context, GoRouterState state) {
    if (!FirebaseAuth.instance.currentUser!.emailVerified) {
      return '/verify-email';
    }
    return null;
  }
}
