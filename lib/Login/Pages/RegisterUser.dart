import 'package:app_heridas/Widget/CustomButton.dart';
import 'package:app_heridas/Widget/CustomDropdownButton.dart';
import 'package:app_heridas/Widget/CustomInitApp.dart';
import 'package:app_heridas/Widget/CustomText.dart';
import 'package:app_heridas/Widget/CustomTextField.dart';
import 'package:app_heridas/core/colors_app.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _roleController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _roleController.dispose();
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
                          text: 'Crear cuenta',
                          fontSize: 24,
                          textColor: AppColors.negroOscuro,
                        ),
                        const SizedBox(height: 4),
                        Customtext(
                          text: 'Ingresa tus datos para crear una cuenta nueva',
                          textColor: Colors.grey,
                        ),
                        const SizedBox(height: 24),

                        //Field: Nombre completo
                        Customtext(
                          text: 'NOMBRE COMPLETO',
                          fontSize: 14,
                          textColor: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Ej. Laura Jimenez Ruiz',
                          keyboardType: TextInputType.name,
                          controllerInput: _emailController,
                          fillColor: Colors.grey[100],
                        ),
                        const SizedBox(height: 18),

                        // Field: Correo electornico
                        Customtext(
                          text: 'CORREO ELECTRONICO',
                          fontSize: 14,
                          textColor: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: 'Ej. laura.sanchez@hospital.co',
                          controllerInput: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          fillColor: Colors.grey[100],
                        ),

                        //Field: Cargo profesional
                        const SizedBox(height: 8),
                        Customtext(
                          text: 'CARGO PROFESIONAL',
                          fontSize: 14,
                          textColor: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        CustomDropdownButton(
                          items: const [
                            'Enfermera/o',
                            'Doctor/a',
                            'Jefe de Enfermería',
                          ],
                          onChanged: (value) {
                            _roleController.text = value;
                          },
                        ),

                        //Field: Contraseñas
                        const SizedBox(height: 8),
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
                        Customtext(
                          text: 'CONFIRMAR CONTRASEÑA',
                          fontSize: 14,
                          textColor: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: '••••••••••••••••',
                          controllerInput: _confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          fillColor: Colors.grey[100],
                        ),
                        const SizedBox(height: 15),
                        // Botón Iniciar sesión
                        Custombutton(
                          texto: 'Registrarme',
                          colorButton: AppColors.verdeOscuro,
                          colorBorder: AppColors.verdeOscuro,
                          colorText: Colors.white,
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
