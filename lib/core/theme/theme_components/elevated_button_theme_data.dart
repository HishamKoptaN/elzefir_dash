import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ElevatedButtonThemeData elevatedButtonTheme({
  required ColorScheme colorScheme,
  required TextTheme textTheme,
}) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.12);
        }
        return colorScheme.primary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        return colorScheme.onPrimary;
      }),
      shadowColor: WidgetStateProperty.all(colorScheme.shadow),
      surfaceTintColor: WidgetStateProperty.all(colorScheme.surfaceTint),
      elevation: WidgetStateProperty.all(2),
      textStyle: WidgetStateProperty.all(textTheme.labelLarge),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
      ),
      minimumSize: WidgetStateProperty.all(Size(120.w, 48.h)),
      alignment: Alignment.center,
    ),
  );
}
