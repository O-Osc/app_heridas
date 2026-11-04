import 'package:app_heridas/Widget/CustomButton.dart';
import 'package:app_heridas/Widget/CustomDivider.dart';
import 'package:app_heridas/Widget/CustomInitApp.dart';
import 'package:app_heridas/Widget/CustomText.dart';
import 'package:app_heridas/Widget/CustomTextField.dart';
import 'package:app_heridas/core/colors_app.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.verdeBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(flex: 2, child: CustomInitApp()),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(28.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Customtext(
                          text: 'Iniciar sesión',
                          fontSize: 24,
                          textColor: AppColors.negroOscuro,
                        ),
                        const SizedBox(height: 4),
                        Customtext(
                          text: 'Ingresa tus datos para continuar',
                          textColor: Colors.grey,
                        ),
                        const SizedBox(height: 24),
                        // Field: Correo Electrónico
                        Customtext(
                          text: 'CORREO ELECTRÓNICO',
                          fontSize: 14,
                          textColor: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'laura.sanchez@hospital.co',
                          keyboardType: TextInputType.emailAddress,
                          controllerInput: _emailController,
                          fillColor: Colors.grey[100],
                        ),
                        const SizedBox(height: 18),
                        // Field: Contraseña
                        Customtext(
                          text: 'CONTRASEÑA',
                          fontSize: 14,
                          textColor: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: '••••••••••••••••',
                          controllerInput: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          fillColor: Colors.grey[100],
                        ),
                        const SizedBox(height: 8),
                        // Botón ¿Olvidaste tu contraseña?
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '¿Olvidaste tu contraseña?',
                              style: TextStyle(
                                color: AppColors.verdeClaro,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Botón Iniciar sesión
                        Custombutton(
                          texto: 'Iniciar sesión',
                          colorButton: AppColors.verdeOscuro,
                          colorBorder: AppColors.verdeOscuro,
                          colorText: Colors.white,
                        ),
                        // Separador "o"
                        Customdivider(),
                        // Botón Crear cuenta nueva
                        Custombutton(
                          texto: 'Crear cuenta nueva',
                          colorButton: AppColors.whiteBackground,
                          colorBorder: AppColors.verdeOscuro,
                          colorText: AppColors.negroOscuro,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
