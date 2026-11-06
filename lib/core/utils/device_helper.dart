import 'package:flutter/widgets.dart';

enum DeviceType { mobile, tablet, desktop }

class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

class DeviceInfo {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < Breakpoints.mobile) {
      return DeviceType.mobile;
    } else {
      return DeviceType.desktop;
    }
  }
}

class DeviceHelper {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1024) {
      return DeviceType.desktop;
    } else if (width >= 600) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }

  static double getResponsiveWidth(BuildContext context) {
    switch (getDeviceType(context)) {
      case DeviceType.desktop:
        return 500;
      case DeviceType.tablet:
        return 400;
      case DeviceType.mobile:
        return 300;
    }
  }

  static double getResponsiveHeight(BuildContext context) {
    switch (getDeviceType(context)) {
      case DeviceType.desktop:
        return 60;
      case DeviceType.tablet:
        return 55;
      case DeviceType.mobile:
        return 50;
    }
  }

  static T responsive<T>(
    BuildContext context, {
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    final width = MediaQuery.sizeOf(context).width;

    if (width < 400) return mobile;
    if (width < 1024) return tablet;
    return desktop;
  }

  static double icon(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    return responsive(
      context,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}

class AppResponsive {
  static double responsive(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    final w = MediaQuery.of(context).size.width;
    if (w < Breakpoints.mobile) return mobile;
    if (w < Breakpoints.mobile) return mobile;
    if (w < Breakpoints.desktop) return tablet;
    return desktop;
  }
}
