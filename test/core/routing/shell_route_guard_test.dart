import 'package:alzefr_dash/core/di/dependency_injection.dart';
import 'package:alzefr_dash/core/networking/api_result.dart';
import 'package:alzefr_dash/core/routing/config/route_config.dart';
import 'package:alzefr_dash/core/routing/middlewares/guards/app_guards.dart';
import 'package:alzefr_dash/features/auth/auth/domain/repo/auth_repo.dart';
import 'package:alzefr_dash/features/auth/auth/domain/usecases/auth_use_casees.dart';
import 'package:alzefr_dash/features/auth/auth/present/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

class _FakeAuthRepo implements AuthRepo {
  @override
  Future<ApiResult<void>> checkFirebase() async =>
      const ApiResult.success(data: null);

  @override
  Future<ApiResult<void>> check() async => const ApiResult.success(data: null);

  @override
  Future<ApiResult<void>> authToken() async =>
      const ApiResult.success(data: null);

  @override
  Future<ApiResult<void>> signOut() async => const ApiResult.success(data: null);

  @override
  Future<ApiResult<void>> firebaseSignOut() async =>
      const ApiResult.success(data: null);
}

GoRouter _testRouter() {
  return GoRouter(
    initialLocation: '/products',
    routes: [
      ShellRoute(
        redirect: AppGuards.authenticatedRedirect,
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: '/products',
            builder: (context, state) =>
                const SizedBox(key: Key('protected')),
          ),
        ],
      ),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => const SizedBox(key: Key('sign-in')),
      ),
    ],
  );
}

void main() {
  late AuthBloc authBloc;

  setUp(() async {
    await getIt.reset();
    authBloc = AuthBloc(AuthUseCases(authRepo: _FakeAuthRepo()));
    getIt.registerSingleton<AuthBloc>(authBloc);
  });

  tearDown(() async => getIt.reset());

  testWidgets('redirects unauthenticated visitors to sign in', (tester) async {
    final router = _testRouter();
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(router.state.matchedLocation, '/sign-in');
    expect(find.byKey(const Key('sign-in')), findsOneWidget);
  });

  testWidgets('allows authenticated visitors into the shell', (tester) async {
    authBloc.add(const AuthEvent.emitAuthenticated());
    final router = _testRouter();
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(router.state.matchedLocation, '/products');
    expect(find.byKey(const Key('protected')), findsOneWidget);
  });

  test('the real dashboard shell is guarded', () {
    final shells = RouteConfig.routes.whereType<ShellRoute>().toList();

    expect(shells, hasLength(1));
    expect(shells.first.redirect, isNotNull);
  });
}
