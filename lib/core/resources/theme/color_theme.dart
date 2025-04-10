import 'package:flutter/material.dart';

class ColorTheme extends ThemeExtension<ColorTheme> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color quaternaryColor;
  final Color penitentiaryColor;
  final Color quinaryColor;
  final Color backgroundColor;
  final Color barColor;
  final Color textColor;
  final Color descriptionColor;
  final Color backColor;
  final Color borderColor;
  final Color secondaryButton;
  final Color errorColor;
  final Color proTextColor;
  final Color proBackColor;
  final Color tileColor;
  final Color subscribeColor;

  // Add new color here if you want to use it in the app

  const ColorTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.tertiaryColor,
    required this.quaternaryColor,
    required this.penitentiaryColor,
    required this.quinaryColor,
    required this.backgroundColor,
    required this.barColor,
    required this.textColor,
    required this.descriptionColor,
    required this.borderColor,
    required this.backColor,
    required this.errorColor,
    required this.secondaryButton,
    required this.proTextColor,
    required this.proBackColor,
    required this.tileColor,
    required this.subscribeColor,
  });

  @override
  ThemeExtension<ColorTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? quaternaryColor,
    Color? penitentiaryColor,
    Color? quinaryColor,
    Color? backgroundColor,
    Color? barColor,
    Color? textColor,
    Color? descriptionColor,
    Color? borderColor,
    Color? backColor,
    Color? errorColor,
    Color? secondaryButton,
    Color? proTextColor,
    Color? proBackColor,
    Color? tileColor,
    Color? subscribeColor,
  }) {
    return ColorTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      tertiaryColor: tertiaryColor ?? this.tertiaryColor,
      quaternaryColor: quaternaryColor ?? this.quaternaryColor,
      penitentiaryColor: penitentiaryColor ?? this.penitentiaryColor,
      quinaryColor: quinaryColor ?? this.quinaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      barColor: barColor ?? this.barColor,
      textColor: textColor ?? this.textColor,
      descriptionColor: descriptionColor ?? this.descriptionColor,
      borderColor: borderColor ?? this.borderColor,
      backColor: backColor ?? this.backColor,
      errorColor: errorColor ?? this.errorColor,
      secondaryButton: secondaryButton ?? this.secondaryButton,
      proTextColor: proTextColor ?? this.proTextColor,
      proBackColor: proBackColor ?? this.proBackColor,
      tileColor: tileColor ?? this.tileColor,
      subscribeColor: subscribeColor ?? this.subscribeColor,
    );
  }

  @override
  ThemeExtension<ColorTheme> lerp(
    covariant ThemeExtension<ColorTheme>? other,
    double t,
  ) {
    if (other is! ColorTheme) {
      return this;
    }
    return ColorTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      quaternaryColor: Color.lerp(quaternaryColor, other.quaternaryColor, t)!,
      penitentiaryColor: Color.lerp(penitentiaryColor, other.penitentiaryColor, t)!,
      quinaryColor: Color.lerp(quinaryColor, other.quinaryColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      barColor: Color.lerp(barColor, other.barColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      descriptionColor: Color.lerp(descriptionColor, other.descriptionColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      backColor: Color.lerp(backColor, other.backColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      secondaryButton: Color.lerp(secondaryButton, other.secondaryButton, t)!,
      proTextColor: Color.lerp(proTextColor, other.proTextColor, t)!,
      proBackColor: Color.lerp(proBackColor, other.proBackColor, t)!,
      tileColor: Color.lerp(tileColor, other.tileColor, t)!,
      subscribeColor: Color.lerp(subscribeColor, other.subscribeColor, t)!,
    );
  }
}
