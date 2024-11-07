import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF2563EB),
    scaffoldBackgroundColor: const Color(0xFFEFF6FF),
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: Color(0xFF2563EB)),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Color(0xFF1F2937)),
      bodyMedium: TextStyle(color: Color(0xFF4B5563)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF60A5FA),
    scaffoldBackgroundColor: const Color(0xFF1F2937),
    cardColor: const Color(0xFF374151),
    iconTheme: const IconThemeData(color: Color(0xFF60A5FA)),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xFF60A5FA), fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Color(0xFFD1D5DB)),
    ),
  );
}
