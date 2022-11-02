import 'package:flutter/material.dart';

class Apptheme {
  Apptheme._();

  ThemeData dark = ThemeData.dark().copyWith();
  static ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
