import 'package:app_heridas/Widget/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:app_heridas/core/colors_app.dart';

class Custombutton extends StatelessWidget {
  final String texto;
  final Color colorButton;
  final Color colorBorder;
  final Color colorText;
  final VoidCallback? onPressed;

  const Custombutton({
    super.key,
    required this.texto,
    this.colorButton = AppColors.verdeOscuro,
    this.colorBorder = AppColors.verdeClaro,
    this.colorText = Colors.white,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: colorButton,

              side: BorderSide(color: colorBorder, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: Customtext(text: texto, textColor: colorText),
          ),
        ),
      ],
    );
  }
}
