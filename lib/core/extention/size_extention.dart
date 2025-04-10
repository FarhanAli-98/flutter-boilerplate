import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  /// Full width of the screen
  double get width => MediaQuery.of(this).size.width;

  /// Full height of the screen
  double get height => MediaQuery.of(this).size.height;

  /// Returns a fraction of the screen width
  double widthPct(double percent) => width * percent;

  /// Returns a fraction of the screen height
  double heightPct(double percent) => height * percent;
}
