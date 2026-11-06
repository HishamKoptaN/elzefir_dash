import 'package:flutter/widgets.dart';

extension ResponsiveIconExtension on num {
  double get iconRes {
    final width =
        WidgetsBinding
            .instance
            .platformDispatcher
            .views
            .first
            .physicalSize
            .width /
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

    if (width >= 1400) {
      return toDouble() * 1.35;
    } else if (width >= 1200) {
      return toDouble() * 1.25;
    } else if (width >= 992) {
      return toDouble() * 1.15;
    } else if (width >= 768) {
      return toDouble() * 1.05;
    }

    return toDouble();
  }
}
