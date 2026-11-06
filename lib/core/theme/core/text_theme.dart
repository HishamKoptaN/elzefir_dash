import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../responsive/responsive_extensions.dart';

extension ResponsiveFontExtension on num {
  double rf(BuildContext context) {
    return context.responsive(
      mobile: this * 1,
      tablet: this * .4,
      desktop: this * .3,
    );
  }
}

TextTheme getLightTextTheme({required BuildContext context}) {
  return TextTheme(
    // هذا النص هو أهم شيء في الشاشة
    displayLarge: TextStyle(fontSize: 22.sp.rf(context), fontWeight: .bold),
    //! -8
    displayMedium: TextStyle(fontSize: 14.sp.rf(context), fontWeight: .bold),
    //! -8
    displaySmall: TextStyle(fontSize: 6.sp.rf(context), fontWeight: .bold),
    //! هل هذا النص ينظم الصفحة؟
    headlineLarge: TextStyle(fontSize: 20.sp.rf(context), fontWeight: .bold),
    //! -8
    headlineMedium: TextStyle(fontSize: 12.sp.rf(context), fontWeight: .bold),
    //! -8
    headlineSmall: TextStyle(fontSize: 8.sp.rf(context), fontWeight: .bold),
    //! هل هذا النص يعرّف عنصرًا !//
    titleLarge: TextStyle(fontSize: 18.sp.rf(context), fontWeight: .bold),
    //! -4
    titleMedium: TextStyle(fontSize: 14.sp.rf(context), fontWeight: .w600),
    //! -2
    titleSmall: TextStyle(fontSize: 12.sp.rf(context), fontWeight: .w500),
    //! هل الهدف من النص أن يُقر !//
    bodyLarge: TextStyle(
      fontSize: 12.sp.rf(context),
      height: 1.6,
      fontWeight: .w600,
    ),
    //! -2
    bodyMedium: TextStyle(
      fontSize: 10.sp.rf(context),
      height: 1.6,
      fontWeight: .w600,
    ),
    //! -2
    bodySmall: TextStyle(
      fontSize: 8.sp.rf(context),
      height: 1.6,
      fontWeight: .w600,
    ),
    //! هل النص داخل عنصر تفاعلي !//
    labelLarge: TextStyle(fontSize: 14.sp.rf(context), fontWeight: .w600),
    //! -2
    labelMedium: TextStyle(fontSize: 12.sp.rf(context), fontWeight: .w600),
    //! -2
    labelSmall: TextStyle(fontSize: 10.sp.rf(context), fontWeight: .w600),
  );
}
