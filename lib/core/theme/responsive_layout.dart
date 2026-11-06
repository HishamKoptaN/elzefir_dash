import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static const double mobileMax = 600;
  static const double tabletMax = 1024;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < mobileMax) {
      return mobile;
    } else if (width < tabletMax) {
      return tablet;
    } else {
      return desktop;
    }
  }
}
