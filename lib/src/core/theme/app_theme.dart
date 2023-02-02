import 'package:flutter/material.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/gen/fonts.gen.dart';

class AppTheme {
  static const _defaultFontFamily = FontFamily.livvicThin;

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: _defaultFontFamily,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorsGuide.solid,
          side: BorderSide(color: ColorsGuide.darkSolid),
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: ColorsGuide.primary),
    );
  }
}
