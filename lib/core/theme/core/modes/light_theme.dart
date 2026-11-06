// import 'package:flutter/material.dart';
// import '../../theme_components/bottom_sheet_theme.dart';
// import '../../theme_components/checkbox_theme.dart';
// import '../../theme_components/dialog_theme_data.dart';
// import '../../theme_components/fab_theme.dart';
// import '../../theme_components/snackbar_theme.dart';
// import '../text_theme.dart';
// import '../../theme_components/app_bar_theme.dart';
// import '../../theme_components/dropdown_menu_theme_data.dart';
// import '../../theme_components/elevated_button_theme_data.dart';
// import '../../theme_components/input_decoration_theme.dart';
// import '../../theme_components/switch_theme_data.dart';
// import '../colors.dart';

// ThemeData lightTheme() {
//   final colorScheme = ColorScheme(
//     brightness: Brightness.light,
//     primary: LightColors.primary,
//     onPrimary: LightColors.onPrimary,
//     primaryContainer: LightColors.primaryContainer,
//     onPrimaryContainer: LightColors.onPrimaryContainer,
//     secondary: LightColors.secondary,
//     onSecondary: Colors.white,
//     error: LightColors.error,
//     onError: Colors.white,
//     surface: LightColors.surface,
//     onSurface: LightColors.onSurface,
//     outline: LightColors.outline,
//   );
//   final textTheme = getLightTextTheme();
//   return ThemeData(
//     colorScheme: colorScheme,
//     brightness: Brightness.light,
//     primaryColor: colorScheme.primary,
//     scaffoldBackgroundColor: colorScheme.surface,
//     cardColor: colorScheme.surface,
//     iconTheme: IconThemeData(color: colorScheme.onSurface, size: 24),
//     textTheme: textTheme,
//     appBarTheme: appBarTheme(colorScheme: colorScheme),
//     dividerTheme: DividerThemeData(color: colorScheme.outline, thickness: 1),
//     bottomSheetTheme: bottomSheetTheme(colorScheme: colorScheme),
//     dialogTheme:
//         dialogThemeData(colorScheme: colorScheme, textTheme: textTheme),
//     checkboxTheme: checkboxTheme(
//       colorScheme: colorScheme,
//     ),
//     floatingActionButtonTheme: fabTheme(
//       colorScheme: colorScheme,
//       textTheme: textTheme,
//     ),
//     snackBarTheme:
//         snackBarTheme(colorScheme: colorScheme, textTheme: textTheme),
//     inputDecorationTheme: inputDecorationTheme(
//       colorScheme: colorScheme,
//       textTheme: textTheme,
//     ),
//     elevatedButtonTheme: elevatedButtonTheme(
//       colorScheme: colorScheme,
//       textTheme: textTheme,
//     ),
//     dropdownMenuTheme: dropdownMenuThemeData(
//       colorScheme: colorScheme,
//       textTheme: textTheme,
//     ),
//     switchTheme: switchThemeData(
//       colorScheme: colorScheme,
//     ),
//     useMaterial3: true,
//     canvasColor: colorScheme.surface,
//     primaryColorLight: colorScheme.primaryContainer,
//     primaryColorDark: colorScheme.primary,
//     dividerColor: colorScheme.outline,
//     shadowColor: colorScheme.shadow,
//     splashColor: colorScheme.primary.withOpacity(0.1),
//     hintColor: colorScheme.onSurfaceVariant,
//     hoverColor: colorScheme.primary.withOpacity(0.05),
//     focusColor: colorScheme.primary.withOpacity(0.1),
//     disabledColor: colorScheme.onSurface.withOpacity(0.38),
//     primaryIconTheme: IconThemeData(color: colorScheme.onPrimary),
//     primaryTextTheme: textTheme,
//     pageTransitionsTheme: const PageTransitionsTheme(builders: {
//       TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
//       TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//     }),
//     scrollbarTheme: ScrollbarThemeData(
//       thumbColor:
//           MaterialStateProperty.all(colorScheme.primary.withOpacity(0.5)),
//       trackColor:
//           MaterialStateProperty.all(colorScheme.onSurface.withOpacity(0.1)),
//     ),
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//     splashFactory: InkRipple.splashFactory,
//   );
// }
