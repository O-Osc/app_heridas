import 'package:app_heridas/Login/Pages/RegisterUser.dart';
import 'package:app_heridas/Paciente/Pages/add-pacient.dart';
import 'package:flutter/material.dart';

import 'core/theme_app.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const RegisterUser(),
    );
  }
}
