import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/device_helper.dart';

class AuthSizes {
  static double fieldWidth(BuildContext context) {
    return AppResponsive.responsive(
      context,
      mobile: MediaQuery.of(context).size.width * .9,
      tablet: 600.w,
      desktop: 600.w,
    );
  }

  static double fieldHeight(BuildContext context) {
    return AppResponsive.responsive(
      context,
      mobile: 65.h,
      tablet: 65.h,
      desktop: 65.h,
    );
  }

  static double buttonWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return double.infinity;
    }

    if (width < 1024) {
      return 500;
    }

    return 597;
  }
}
