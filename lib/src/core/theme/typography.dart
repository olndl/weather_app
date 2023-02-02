import 'package:flutter/material.dart';
import 'package:weather_app/src/core/theme/colors_guide.dart';
import 'package:weather_app/src/gen/fonts.gen.dart';

abstract class TextStyles {
  static TextStyle largeTitle = TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.normal,
    letterSpacing: .37,
    color: ColorsGuide.primary,
    fontFamily: FontFamily.livvicThin,
  );
  static TextStyle title1 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.normal,
    letterSpacing: .37,
    color: ColorsGuide.primary,
    fontFamily: FontFamily.livvicThin,
  );
  static TextStyle title2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    letterSpacing: .37,
    color: ColorsGuide.primary,
    fontFamily: FontFamily.livvicThin,
  );
  static TextStyle title3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    letterSpacing: .37,
    color: ColorsGuide.primary,
    fontFamily: FontFamily.livvicThin,
  );
  static TextStyle headline = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.normal,
    letterSpacing: .37,
    color: ColorsGuide.primary,
    fontFamily: FontFamily.livvicThin,
  );
  static TextStyle body = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.normal,
    letterSpacing: .37,
    color: ColorsGuide.primary,
    fontFamily: FontFamily.livvicThin,
  );
  static TextStyle callout = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.normal,
    letterSpacing: .37,
    color: ColorsGuide.primary,
    fontFamily: FontFamily.livvicThin,
  );
}
