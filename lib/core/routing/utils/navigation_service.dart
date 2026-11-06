import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  NavigationService._();
  static Future<T?> pushNamed<T>({
    required BuildContext context,
    required String routeName,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return context.pushNamed<T>(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void goNamed({
    required BuildContext context,
    required String routeName,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    context.goNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void pushReplacementNamed<T>({
    required BuildContext context,
    required String routeName,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return context.pushReplacementNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void replaceNamed({
    required BuildContext context,
    required String routeName,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    context.replaceNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static Future<T?> push<T>({
    required BuildContext context,
    required String routeName,
    Object? extra,
  }) {
    return context.push<T>(routeName, extra: extra);
  }

  static void pop<T>(BuildContext context, [T? result]) {
    if (context.canPop()) {
      context.pop<T>(result);
    }
  }
}
