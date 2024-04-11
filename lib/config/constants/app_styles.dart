import 'package:flutter/material.dart';
import 'package:neo_tour/config/constants/app_colors.dart';

class AppStyles {
  static TextStyle s36w900 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w900,
    fontSize: 36,
    fontFamily: 'SfProDisplayBold',
  );

  static TextStyle s16w400 = const TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SfProDisplay',
    height: 2,
  );

  static TextStyle s16w500 = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'SfProDisplay',
    height: 2,
  );

  static TextStyle s16w700 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontFamily: 'SfProDisplay',
    height: 2,
  );

  static TextStyle s16w600 = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'SfProDisplay',
    height: 2,
  );
}