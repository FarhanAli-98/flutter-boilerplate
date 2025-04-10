import 'package:template/core/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension XBrightness on Brightness {
  bool get isDark => this == Brightness.dark;
  bool get isLight => this == Brightness.light;
}

final themeModeProvider = StateNotifierProvider<ThemeModeStateNotifier, ThemeMode>((ref) {
  return ThemeModeStateNotifier(
    AppPreferences().getAppThemeMode(),
  );
});

class ThemeModeStateNotifier extends StateNotifier<ThemeMode> {
  ThemeModeStateNotifier(super.state);

  void toggleTheme(BuildContext context) {
    switch (state) {
      case ThemeMode.light:
        state = ThemeMode.dark;
        break;
      case ThemeMode.system:
      case ThemeMode.dark:
        state = ThemeMode.light;
        break;
    }
    AppPreferences preferences = AppPreferences();
    preferences.setAppThemeMode(state);
  }

  ThemeMode getCurrentThemeMode() => state;
}
