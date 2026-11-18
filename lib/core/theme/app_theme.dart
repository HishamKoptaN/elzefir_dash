import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'core/text_theme.dart';

class AppTheme {
  AppTheme._({required BuildContext context});
  static const AppColors _light = LightColors();
  static const AppColors _dark = DarkColors();
  static ThemeData lightTheme(BuildContext context) {
    final textTheme = getLightTextTheme(context: context);
    final colorScheme = ColorScheme.light(
      primary: _light.primary,
      onPrimary: Colors.white,
      secondary: const Color(0xFF48A999),
      onSecondary: Colors.white,
      tertiary: const Color(0xFFFF7F50),
      onTertiary: Colors.white,
      surface: _light.surface,
      surfaceContainer: _light.surface,
      surfaceContainerHigh: const Color(0xFFF1F5F9),
      surfaceContainerHighest: const Color(0xFFE2E8F0),
      onSurface: _light.textPrimary,
      outline: const Color(0xFFE2E8F0),
      error: AppColors.danger,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'NotoNaskhArabic',
      scaffoldBackgroundColor: _light.background,
      textTheme: textTheme,
      colorScheme: colorScheme,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 1,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          color: _light.textPrimary,
        ),
        foregroundColor: _light.primary,
        toolbarTextStyle: textTheme.bodyLarge,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: _light.surface,
        elevation: 2,
        indicatorColor: _light.primary.withValues(alpha: 0.12),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          return IconThemeData(
            color: states.contains(WidgetState.selected)
                ? _light.primary
                : _light.textSecondary,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return textTheme.labelLarge!.copyWith(
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            color: selected ? _light.primary : _light.textSecondary,
          );
        }),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: _light.surface,
        indicatorColor: _light.primary.withValues(alpha: 0.12),
        indicatorShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        selectedLabelTextStyle: textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: _light.primary,
        ),
        unselectedLabelTextStyle: textTheme.labelLarge?.copyWith(
          color: _light.textSecondary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        linearMinHeight: 2,
        color: Colors.white,
        strokeWidth: 2,
      ),
      cardTheme: CardThemeData(
        color: _light.surface,
        elevation: 1,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: .circular(14.r)),
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: TextStyle(fontSize: 20.sp.rf(context), color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: .circular(8.r),
        ),
        padding: .symmetric(horizontal: 12.w, vertical: 6.h),
        waitDuration: const Duration(milliseconds: 500),
      ),
      // tooltipTheme: TooltipThemeData(
      //   textStyle: TextStyle(color: Colors.white, fontSize: 18.sp),
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          shape: RoundedRectangleBorder(borderRadius: .circular(10.r)),
          backgroundColor: _light.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: _light.textSecondary.withValues(alpha: 0.24),
          disabledForegroundColor: _light.textSecondary.withValues(alpha: 0.48),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: textTheme.labelLarge,
          minimumSize: Size(120.w, 48.h),
          maximumSize: Size(.infinity, 48.h),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: .circular(8.r)),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _light.surface,
        prefixIconColor: _light.textSecondary.withValues(alpha: 0.6),
        suffixIconColor: _light.textSecondary.withValues(alpha: 0.6),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22.sp,
          height: 27 / 24,
          color: _light.textSecondary.withValues(alpha: 0.5),
        ),
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(vertical: 15.h),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _light.textSecondary.withValues(alpha: 0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _light.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.danger, width: 1.5),
        ),
        errorStyle: TextStyle(color: AppColors.danger, fontSize: 12.sp),
      ),
      iconTheme: IconThemeData(
        color: _light.textPrimary.withValues(alpha: 0.6),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: _light.textPrimary,
        ),
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(_light.surface),
          elevation: WidgetStateProperty.all(8),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: _light.textSecondary.withValues(alpha: 0.1),
              ),
            ),
          ),
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 8.h)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _light.textSecondary,
          // side: BorderSide(color: _light.outline, width: 1),
          textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'NotoNaskhArabic',
      scaffoldBackgroundColor: _dark.background,
      colorScheme: ColorScheme.dark(
        primary: _dark.primary,
        surface: _dark.surface,
        error: AppColors.danger,
        onPrimary: Colors.black,
        onSurface: _dark.textPrimary,
      ),
      cardTheme: CardThemeData(color: _light.surface, elevation: 4),
    );
  }
}
