import 'package:flutter/material.dart';

class AppTheme {
  // Sophisticated Neutrals Theme
  static final lightTheme = ThemeData(
    primaryColor: const Color(0xFF3D4B6C),
    secondaryHeaderColor: const Color(0xFF7790C9),
    scaffoldBackgroundColor: const Color(0xFFF9FAFF),
    cardColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF3D4B6C),
      secondary: Color(0xFF7790C9),
      tertiary: Color(0xFFB4C6E7),
      surface: Colors.white,
      background: Color(0xFFF9FAFF),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: const Color(0xFF2A3346),
    secondaryHeaderColor: const Color(0xFF4A5C8B),
    scaffoldBackgroundColor: const Color(0xFF1A1D24),
    cardColor: const Color(0xFF252A35),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF4A5C8B),
      secondary: Color(0xFF7790C9),
      tertiary: Color(0xFF3D4B6C),
      surface: Color(0xFF252A35),
      background: Color(0xFF1A1D24),
    ),
  );
}
