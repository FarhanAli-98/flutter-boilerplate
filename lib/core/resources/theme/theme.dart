import 'package:template/core/constants/dimentions.dart';
import 'package:template/core/resources/theme/theme_font.dart';
import 'package:flutter/material.dart';

import 'color_theme.dart';
import 'light_theme.dart';

/// A base class that provides the common implementation of [themeData] and [textTheme] for the app.
/// The above properties should not be overridden in the subclasses.
///
/// The UIkit in Figma and [themeData] class in [AppTheme] are the single source of truth for the app's design system.
/// See, [LightTheme] and [DarkTheme] for more details.

abstract class AppTheme {
  ColorTheme get colorTheme;
  static FontTheme fontTheme = const FontTheme(primaryFont: 'Inter');
  Brightness get brightness;

  TextTheme get textTheme {
    return TextTheme(
      titleSmall: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 14.0,
        color: colorTheme.primaryColor,
      ),
      titleMedium: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 18.0,
        color: colorTheme.primaryColor,
      ),
      titleLarge: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 20.0,
        color: colorTheme.primaryColor,
      ),
      labelSmall: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 14.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w100,
      ),
      labelMedium: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 16.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 18.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w100,
      ),
      bodySmall: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 14.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w200,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 16.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w100,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 18.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w100,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 16.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w300,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 18.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w300,
      ),
      headlineLarge: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 20.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w300,
      ),
      displaySmall: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 18.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w200,
      ),
      displayMedium: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 20.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w200,
      ),
      displayLarge: TextStyle(
        fontFamily: fontTheme.primaryFont,
        fontSize: 22.0,
        color: colorTheme.primaryColor,
        fontWeight: FontWeight.w200,
      ),
    );
  }

  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      primaryColor: colorTheme.tertiaryColor,
      fontFamily: fontTheme.primaryFont,
      scaffoldBackgroundColor: colorTheme.primaryColor,
      brightness: brightness,
      canvasColor: colorTheme.secondaryColor,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorTheme.secondaryColor,
        behavior: SnackBarBehavior.floating,
      ),
      cardColor: colorTheme.tertiaryColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: colorTheme.secondaryColor,
        titleTextStyle: textTheme.labelSmall,
        iconTheme: IconThemeData(
          color: colorTheme.secondaryColor,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 1,
        backgroundColor: colorTheme.tertiaryColor,
      ),
      textTheme: textTheme,
      listTileTheme: ListTileThemeData(
        iconColor: colorTheme.tertiaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorTheme.secondaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colorTheme.secondaryColor,
        backgroundColor: colorTheme.secondaryColor,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(colorTheme.backgroundColor),
        trackColor: WidgetStateProperty.all(colorTheme.primaryColor),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelStyle: textTheme.labelSmall,
        unselectedLabelColor: colorTheme.secondaryColor,
        labelColor: colorTheme.secondaryColor,
        labelStyle: textTheme.labelSmall,
      ),
      indicatorColor: colorTheme.tertiaryColor,
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colorTheme.tertiaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorTheme.backgroundColor,
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorTheme.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorTheme.errorColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorTheme.errorColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorTheme.borderColor, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorTheme.borderColor, width: 2),
        ),
        outlineBorder: BorderSide(color: colorTheme.borderColor, width: 2),
        hintStyle: TextStyle(
          fontFamily: fontTheme.primaryFont,
          fontSize: 14.0,
          color: colorTheme.descriptionColor,
        ),
        contentPadding: const EdgeInsets.all(Dimensions.padding_12),
        errorStyle: textTheme.labelSmall?.copyWith(
          color: colorTheme.errorColor,
          fontFamily: fontTheme.primaryFont,
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[
        colorTheme,
      ],
    );
  }
}
