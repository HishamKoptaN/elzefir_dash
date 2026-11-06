import 'package:flutter/material.dart';

class Breakpoints {
  static const double mobile = 500;
  static const double tablet = 1200;
}

enum DeviceType { mobile, tablet, desktop }

DeviceType getDeviceType(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < Breakpoints.mobile) return DeviceType.mobile;
  if (width < Breakpoints.tablet) return DeviceType.tablet;
  return DeviceType.desktop;
}

DeviceType getDeviceTypeFromConstraints(BoxConstraints constraints) {
  final width = constraints.maxWidth;
  if (width < Breakpoints.mobile) return DeviceType.mobile;
  if (width < Breakpoints.tablet) return DeviceType.tablet;
  return DeviceType.desktop;
}

T responsiveValue<T>({
  required BuildContext context,
  required T mobile,
  required T tablet,
  required T desktop,
}) {
  switch (getDeviceType(context)) {
    case DeviceType.mobile:
      return mobile;
    case DeviceType.tablet:
      return tablet;
    case DeviceType.desktop:
      return desktop;
  }
}

class AdaptiveValue<T> {
  final BuildContext context;
  final T mobile;
  final T tablet;
  final T desktop;

  AdaptiveValue({
    required this.context,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  T build() => responsiveValue(
        context: context,
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
      );
}

bool isLandscape(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.landscape;
bool isPortrait(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;
class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  final WidgetBuilder desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final type = getDeviceTypeFromConstraints(constraints);
        switch (type) {
          case DeviceType.mobile:
            return mobileLayout(context);
          case DeviceType.tablet:
            return tabletLayout(context);
          case DeviceType.desktop:
            return desktopLayout(context);
        }
      },
    );
  }
}
