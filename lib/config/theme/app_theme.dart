import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    return ThemeData(elevatedButtonTheme: _elevatedButton);
  }

  static ElevatedButtonThemeData get _elevatedButton => ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.primaryColor,
          ),
          maximumSize: MaterialStateProperty.all(
            const Size.fromWidth(178),
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      );
}
