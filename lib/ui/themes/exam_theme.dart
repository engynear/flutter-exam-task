import 'package:flutter/material.dart';

class ExamTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.yellow,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.yellow,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        fillColor: Colors.yellow[100],
        filled: true,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.yellow[700],
        foregroundColor: Colors.black,
      ),
    );
  }
}
