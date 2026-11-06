import 'package:flutter/material.dart';

import '../device_helper.dart';

extension DeviceTypeExtension on BuildContext {
  bool get isDesk => DeviceHelper.getDeviceType(this) == DeviceType.desktop;
  bool get isMob => DeviceHelper.getDeviceType(this) == DeviceType.mobile;
  bool get isTab => DeviceHelper.getDeviceType(this) == DeviceType.tablet;
}

extension IconSizeExtension on BuildContext {
  double iconSize({required double size}) {
    return AppResponsive.responsive(
      this,
      mobile: size * 0.8,
      tablet: size,
      desktop: size,
    );
  }
}
