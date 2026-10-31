import 'package:app_heridas/colors_app.dart';
import 'package:flutter/material.dart';

class Customdivider extends StatelessWidget {
  const Customdivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 50,
      color: AppColors.greyTextBox,
      thickness: 2,
      indent: 20,
      endIndent: 20,

    );
  }
}
