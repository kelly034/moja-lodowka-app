import "package:flutter/material.dart";

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.grey[100],
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.green[600],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      colorScheme: ColorScheme.light(
        primary: Colors.green[600]!,
        onPrimary: Colors.grey[100]!,
        secondaryContainer: Colors.green[100],
        onSecondaryContainer: Colors.green[900],
        surface: Colors.grey[100]!,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[600],
          foregroundColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[850],
        foregroundColor: Colors.grey[100],
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.grey[850],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadowColor: Colors.grey[500],
      ),
      colorScheme: ColorScheme.dark(
        primary: Colors.green[400]!,
        onPrimary: Colors.grey[100]!,
        secondaryContainer: Colors.green[900],
        onSecondaryContainer: Colors.grey[100],
        surface: Colors.grey[900]!,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          shadowColor: Colors.grey[500],
          backgroundColor: Colors.grey[850],
          foregroundColor: Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
