import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/env_config.dart';

class DebugRouteBanner extends StatelessWidget {
  final Widget child;
  final GoRouter router;
  final bool enableLogging;
  const DebugRouteBanner({
    super.key,
    required this.child,
    required this.router,
    this.enableLogging = false,
  });

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode && !enableLogging) {
      return child;
    }
    final location = router.routerDelegate.currentConfiguration.uri;
    const commitMessage = String.fromEnvironment(
      'COMMIT_MESSAGE',
      defaultValue: 'Local Development (No Commit)',
    );
    return Column(
      children: [
        Text(
          'localhost:8080${location.toString()}',
          style: const TextStyle(
            color: Colors.green,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          EnvConfig.config.baseUrl,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.blue.shade900.withOpacity(0.1),
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            '🚀 Last Commit: $commitMessage',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
