import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../globals/database/shared_pref_helper.dart';

@singleton
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadThemeFromPrefs();
  }
  static const String _themePreferenceKey = "is_dark_mode";
  void _loadThemeFromPrefs() async {
    final bool isDarkMode = await SharedPrefHelper.getBool(
      key: _themePreferenceKey,
    );
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  void setLightMode() async {
    emit(ThemeMode.light);
    await SharedPrefHelper.setData(key: _themePreferenceKey, value: false);
  }

  void setDarkMode() async {
    emit(ThemeMode.dark);
    await SharedPrefHelper.setData(key: _themePreferenceKey, value: true);
  }

  void toggleTheme() async {
    if (state == ThemeMode.light) {
      setDarkMode();
    } else {
      setLightMode();
    }
  }
}
