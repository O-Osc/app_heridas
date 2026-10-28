import 'package:flutter/material.dart';
import 'colors_app.dart';

class AppTheme{
  AppTheme._();

  static ThemeData get lightTheme{
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.background,
    );
  }
}