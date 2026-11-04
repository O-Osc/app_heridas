import 'package:app_heridas/core/colors_app.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controllerInput;
  final int? maxLine;
  final TextInputType? keyboardType;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controllerInput,
    this.maxLine = 1,
    this.fillColor = Colors.white,

    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerInput,
      maxLines: maxLine,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintText: hintText,
        hintMaxLines: 2,
        hintStyle: TextStyle(color: AppColors.negroOscuro),
        fillColor: fillColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.greyTextBox),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.greyTextBox),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.greyTextBox),
        ),
      ),
    );
  }
}
