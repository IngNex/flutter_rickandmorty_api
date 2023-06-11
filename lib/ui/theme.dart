import 'package:flutter/material.dart';

class AppColors {
  static final green = Colors.green;
  static final greenDark = Color.fromARGB(255, 66, 157, 71);
  static final white = Colors.white;
  static final black = Colors.black;
  static final scaffoldBackground = Color.fromARGB(255, 3, 35, 20);
  static final cardDark = Color.fromARGB(255, 5, 48, 32);
  static final cardLight = Colors.white;
}

ThemeData lightTheme = ThemeData(
  primarySwatch: AppColors.green,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.green,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.black,
    ),
  ),
  scaffoldBackgroundColor: AppColors.white,
  cardTheme: CardTheme(
    color: AppColors.cardLight,
    shadowColor: AppColors.green,
  ),
  hintColor: AppColors.black,
);

ThemeData darkTheme = ThemeData(
  primarySwatch: AppColors.green,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.greenDark,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  cardTheme: CardTheme(
    shadowColor: AppColors.black,
    color: AppColors.cardDark,
  ),
  hintColor: AppColors.white,
  highlightColor: Colors.green,
);
