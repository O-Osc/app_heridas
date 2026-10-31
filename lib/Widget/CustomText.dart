import 'package:app_heridas/colors_app.dart';
import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {

  final String text;
  final Color? textColor;
  final double? fontSize;

  const Customtext({

    super.key,
    required this.text,
    this.textColor,
    this.fontSize,

  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: textColor ?? AppColors.negroOscuro,
        fontSize: fontSize ?? 16,

    ));
  }
}
