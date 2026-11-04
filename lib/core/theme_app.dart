import 'package:flutter/material.dart';
import 'colors_app.dart';
 
class AppTheme {
  AppTheme._();
 
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.background,
    );
  }
}
 