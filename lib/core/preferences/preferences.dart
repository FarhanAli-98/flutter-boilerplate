import 'package:template/core/preferences/base_preferences.dart';
import 'package:flutter/material.dart';

class AppPreferences extends BasePreferences {
  final _appThemeMode = '_appThemeMode';
  final _email = '_email';

  void setAppThemeMode(ThemeMode themeMode) {
    store<String>(_appThemeMode, themeMode.name);
  }

  void setEmail(String email) {
    store<String>(_email, email);
  }

  String? getEmail() {
    return retrieve<String>(_email);
  }

  ThemeMode getAppThemeMode() {
    final data = retrieve<String>(_appThemeMode);
    return ThemeMode.values.firstWhere(
      (e) => e.name == data,
      orElse: () => ThemeMode.light,
    );
  }
}
