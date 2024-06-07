import 'package:age_estimator/core/constants/values.dart';
import 'package:flutter/material.dart';

/// Define a [ThemeData] object named lightTheme
ThemeData lightTheme = ThemeData(
  useMaterial3: true,

  /// inputDecorationTheme
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xff949494),
      height: 1.2,
    ),
    contentPadding: const EdgeInsets.symmetric(
        horizontal: kNormalPadding, vertical: kMediumPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kLargePadding),
    ),
  ),

  /// Define a color scheme with specific colors for different parts of the UI
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFE0E0E0),
    onPrimary: Colors.black,
    error: Color(0xFFCA0000),
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    primaryContainer: Colors.white,
    secondary: Color(0xFFD94B5D),
    onSecondary: Colors.white,
    tertiary: Color(0xff3b3a3a),
    secondaryContainer: Color(0xFFD94B5D),
  ),

  /// Set the text styles for various text elements in the UI
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    displayMedium: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    displaySmall: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    headlineLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    headlineMedium: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      color: Color(0xFF3B3A3A),
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      color: Color(0xFF3B3A3A),
    ),
  ),

  /// Set the style for the [ElevatedButton] widget
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: const Color(0xFFD94B5D),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: Colors.white,
      disabledBackgroundColor: const Color(0xFFE0E0E0),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
        color: Colors.white,
      ),
    ),
  ),
);
