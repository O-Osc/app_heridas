import 'package:app_heridas/Widget/CustomText.dart';
import 'package:app_heridas/core/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Widget/CustomButton.dart';
import '../../Widget/CustomGenderField.dart';
import '../../Widget/CustomTextField.dart';
import '../../Widget/CustomPickerInput.dart';
import '../../Widget/CustomDivider.dart';

class AddPatient extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _identificationController = TextEditingController();
  final _numberPhoneController = TextEditingController();
  final _epsController = TextEditingController();
  final _diagnosisController = TextEditingController();
  final _backgroundController = TextEditingController();
  final _observationsController = TextEditingController();

  new({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leadingWidth: 50,
        titleSpacing: 0,
        title: const Text(
          'Agregar Paciente',
          style: TextStyle(color: AppColors.whiteBackground),
        ),
        backgroundColor: AppColors.verdeOscuro,
        leading: IconButton(onPressed: () {
          context.pop();
        }, icon: Icon(Icons.arrow_back, color: AppColors.whiteBackground,)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: widget._formKey,
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
                  CustomTextField(
                    hintText: 'Ej. Maria Garcia López',
                    controllerInput: widget._nameController,
                  ),
                  SizedBox(height: 20),
                  Customtext(text: 'Fecha nacimiento'),
                  CustomPickerInput(),
                  SizedBox(height: 20),
                  CustomGenderField(),
                  SizedBox(height: 20),
                  Customtext(text: 'Numero de documento'),
                  CustomTextField(
                    hintText: 'Ej. 1234567890',
                    controllerInput: widget._identificationController,
                  ),
                  SizedBox(height: 20),
                  Customtext(text: 'Teléfono de contacto'),
                  CustomTextField(
                    hintText: 'Ej. 300 123 4567',
                    controllerInput: widget._numberPhoneController,
                  ),
                  SizedBox(height: 20),
                  Customtext(text: 'EPS'),
                  CustomTextField(
                    hintText: 'Ej. Salud Total',
                    controllerInput: widget._epsController,
                  ),
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
                  CustomTextField(
                    hintText: 'Ej. Pie diabetico, úlcera....',
                    controllerInput: widget._diagnosisController,
                  ),
                  SizedBox(height: 20),
                  Customtext(text: 'Antecedentes relevantes'),
                  CustomTextField(
                    hintText: 'Ej. Diabetes tipo 2, hipertension....',
                    maxLine: 3,
                    controllerInput: widget._backgroundController,
                  ),
                  SizedBox(height: 20),
                  Customtext(text: 'Observaciones iniciales'),
                  CustomTextField(
                    hintText: 'Ej. Cual quier informacion adicional relevante al inicio del seguimiento..',
                    maxLine: 3,
                    controllerInput: widget._observationsController,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
