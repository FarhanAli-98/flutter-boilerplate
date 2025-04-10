import 'package:template/core/resources/theme/theme.dart';
import 'package:flutter/material.dart';

import 'color_theme.dart';

class LightTheme extends AppTheme {
  @override
  final ColorTheme colorTheme = const ColorTheme(
    primaryColor: Color(0xFFBE3144),
    secondaryColor: Color(0xFF565D6D),
    tertiaryColor: Color(0xFF707075),
    quaternaryColor: Color(0xffFFFFFF),
    penitentiaryColor: Color(0xffF1AF3C),
    quinaryColor: Color(0xffE5E5E5),
    backgroundColor: Color(0xff080911),
    barColor: Color(0xffE5E5E5),
    textColor: Color(0xFFE6E6E7),
    descriptionColor: Color(0xFF999999),
    backColor: Color(0xFFF1F1F1),
    borderColor: Color(0xFF323339),
    errorColor: Color(0xFFDC2626),
    secondaryButton: Color(0xFFFFFFFF),
    proTextColor: Color(0xFF1E3A8A),
    proBackColor: Color(0xFFF1F1F1),
    tileColor: Color(0x0f615EF0),
    subscribeColor: Color(0xFFFCFDFD),
  );
  @override
  final Brightness brightness = Brightness.light;
}
