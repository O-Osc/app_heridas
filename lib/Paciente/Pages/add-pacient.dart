import 'package:app_heridas/Widget/CustomText.dart';
import 'package:app_heridas/colors_app.dart';
import 'package:flutter/material.dart';

import '../../Widget/CustomButton.dart';
import '../../Widget/CustomGenderField.dart';
import '../../Widget/CustomTextField.dart';
import '../../Widget/CustomPickerInput.dart';
import '../../Widget/CustomDivider.dart';

class AddPacient extends StatefulWidget {
  const new({super.key});

  @override
  State<AddPacient> createState() => _AddPacientState();
}

class _AddPacientState extends State<AddPacient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          'Agregar Paciente',
          style: TextStyle(backgroundColor: AppColors.verdeOscuro),
        ),
        backgroundColor: AppColors.verdeClaro,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Customtext(
                      text: 'INFORMACIÓN PERSONAL',
                      textColor: AppColors.verdeClaro,
                    ),
                  ),
                  Customtext(text: 'Nombre completo'),
                  CustomTextField(hintText: 'Ej. Maria Garcia López'),
                  SizedBox(height: 20),
                  Customtext(text: 'Fecha nacimiento'),
                  CustomPickerInput(),
                  SizedBox(height: 20),
                  CustomGenderField(),
                  SizedBox(height: 20),
                  Customtext(text: 'Numero de documento'),
                  CustomTextField(hintText: 'Ej. 1234567890'),
                  SizedBox(height: 20),
                  Customtext(text: 'Teléfono de contacto'),
                  CustomTextField(hintText: 'Ej. 300 123 4567'),
                  SizedBox(height: 20),
                  Customtext(text: 'EPS'),
                  CustomTextField(hintText: 'Ej. Salud Total'),
                  //Seccion de informacion cliica
                  Customdivider(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Customtext(
                      text: 'INFORMACIÓN CLÍNICA',
                      textColor: AppColors.verdeClaro,
                    ),
                  ),
                  Customtext(text: 'Diagnóstico principal'),
                  CustomTextField(hintText: 'Ej. Pie diabetico, úlcera....'),
                  SizedBox(height: 20),
                  Customtext(text: 'Antecedentes relevantes'),
                  CustomTextField(
                    hintText: 'Ej. Diabetes tipo 2, hipertension....',
                    maxLine: 3,
                  ),
                  SizedBox(height: 20),
                  Customtext(text: 'Observaciones iniciales'),
                  CustomTextField(
                    hintText: 'Ej. Cual quier informacion adicional relevante al inicio del seguimiento..',
                    maxLine: 3,
                  ),
                  Customdivider(),
                  Custombutton(
                    texto: 'Guardar paciente',
                    colorButton: AppColors.verdeOscuro,
                    colorBorder: AppColors.verdeOscuro,
                    colorText: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Custombutton(
                    texto: 'Cancelar',
                    colorButton: Colors.white,
                    colorBorder: AppColors.verdeOscuro,
                    colorText: AppColors.verdeOscuro,
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
