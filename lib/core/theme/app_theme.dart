import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
 
/// Configuración centralizada del ThemeData de la app.
class AppTheme {
  AppTheme._();
 
  static ThemeData get light {
    return ThemeData(
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.fondo,
    );
  }
}
