import 'package:flutter/material.dart';

class BaseColor {
  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFE1E4E9),
    100: Color(0xFFB5BCC8),
    200: Color(0xFF8490A3),
    300: Color(0xFF53647E),
    400: Color(0xFF2E4263),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFF081D40),
    700: Color(0xFF061837),
    800: Color(0xFF05142F),
    900: Color(0xFF020B20),
  });
  static const int _primaryPrimaryValue = 0xFF092147;

  static const MaterialColor primaryAccent =
      MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFF5D7FFF),
    200: Color(_primaryAccentValue),
    400: Color(0xFF0034F6),
    700: Color(0xFF002EDC),
  });
  static const int _primaryAccentValue = 0xFF2A57FF;
}
