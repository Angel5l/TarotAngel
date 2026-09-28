import 'package:flutter/material.dart';

final ColorScheme _lightScheme =
    ColorScheme.fromSeed(
      seedColor: const Color(0xFF000000),
      brightness: Brightness.light,
    ).copyWith(
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF000000),
    );

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
}

final TextTheme _textTheme = TextTheme(
  headlineSmall: const TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
  bodyMedium: const TextStyle(
    fontFamily: 'Playfair Display',
    fontSize: 15,
    fontWeight: FontWeight.normal,
    height: 1.5,
  ),
  labelSmall: const TextStyle(
    fontFamily: 'Spectral',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.6,
  ),
);

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _lightScheme,
  textTheme: _textTheme,
  cardTheme: const CardThemeData(margin: EdgeInsets.all(8)),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
  ),
);
