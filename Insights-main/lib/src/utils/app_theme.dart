import 'package:app/src/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getThemeApp = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
