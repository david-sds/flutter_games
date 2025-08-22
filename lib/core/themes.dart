import 'package:flutter/material.dart';

ThemeData _baseThemeData(ThemeData themeDataBase, ColorScheme colorScheme) {
  return themeDataBase.copyWith(
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.onPrimary,
    ),
  );
}

ThemeData lightTheme = _baseThemeData(ThemeData.light(), _lightColorScheme);

ThemeData darkTheme = _baseThemeData(ThemeData.dark(), _darkColorScheme);

ColorScheme _lightColorScheme = ColorScheme.light().copyWith(
  brightness: Brightness.light,
  primary: const Color(0xff6200ee),
  onPrimary: Colors.white,
  secondary: const Color(0xff03dac6),
  onSecondary: Colors.black,
  error: const Color(0xffb00020),
  onError: Colors.white,
  surface: Colors.grey[600], //Colors.white,
  onSurface: Colors.black,
  primaryContainer: const Color(0xff3700b3),
  secondaryContainer: const Color(0xff018786),
);

ColorScheme _darkColorScheme = ColorScheme.dark().copyWith(
  brightness: Brightness.dark,
  primary: const Color(0xffbb86fc),
  onPrimary: Colors.black,
  secondary: const Color(0xff03dac6),
  onSecondary: Colors.black,
  error: const Color(0xffcf6679),
  onError: Colors.black,
  surface: Colors.grey[600], // const Color(0xff121212),
  onSurface: Colors.white,
  primaryContainer: const Color(0xff3700B3),
  secondaryContainer: const Color(0xff03dac6),
);
