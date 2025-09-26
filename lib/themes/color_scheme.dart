import 'package:flutter/material.dart';

class MyColorScheme {
  static Color primaryColor = Color.fromRGBO(37, 99, 235, 1);
  static ColorScheme lightColorScheme =
      ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ).copyWith(
        primary: primaryColor,
        error: Colors.red,
        surface: const Color.fromRGBO(235, 235, 235, 1),
        onSurface: const Color.fromRGBO(50, 50, 50, 1),
        primaryContainer: const Color.fromRGBO(255, 255, 255, 1),
        onPrimaryContainer: Color.fromRGBO(117, 117, 117, 1),

        // onPrimaryContainer: const Color.fromRGBO(44, 44, 44, .6),
      );

  static ColorScheme darkColorScheme =
      ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ).copyWith(
        primary: primaryColor,
        error: Colors.red,
        surface: const Color.fromRGBO(24, 24, 24, 1),
        onSurface: const Color.fromRGBO(235, 235, 235, 1),
        primaryContainer: const Color.fromRGBO(44, 44, 44, 1),
        onPrimaryContainer: Colors.grey[500],
        //  const Color.fromRGBO(135, 135, 135, 1),
      );
}
