import 'package:app_heridas/colors_app.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLine;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hintText,
        hintMaxLines: 2,
        hintStyle: TextStyle(
          color: AppColors.greyTextBox,
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyTextBox,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyTextBox,
          ),
        ),
      ),
    );
  }
}
