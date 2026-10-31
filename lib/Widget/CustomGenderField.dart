import 'package:app_heridas/colors_app.dart';
import 'package:flutter/material.dart';

import 'CustomText.dart';

enum Sexo { masculino, femenino }

class CustomGenderField extends StatefulWidget {
  const CustomGenderField({super.key});

  @override
  State<CustomGenderField> createState() => _CustomGenderFieldState();
}

class _CustomGenderFieldState extends State<CustomGenderField> {
  Sexo _sexoSeleccionado = Sexo.masculino;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sexo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildBoton(Sexo.masculino, 'Masculino')),
            const SizedBox(width: 12),
            Expanded(child: _buildBoton(Sexo.femenino, 'Femenino')),
          ],
        ),
      ],
    );
  }

  Widget _buildBoton(Sexo sexo, String texto) {
    final bool seleccionado = _sexoSeleccionado == sexo;
    const Color colorPrimario = AppColors.verdeOscuro;

    return OutlinedButton(
      onPressed: () => setState(() => _sexoSeleccionado = sexo),
      style: OutlinedButton.styleFrom(
        backgroundColor: seleccionado ? colorPrimario : Colors.transparent,
        side: BorderSide(
          color: seleccionado ? colorPrimario : Colors.grey.shade400,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      child: Customtext(
        text: texto,
        textColor: seleccionado ? Colors.white : Colors.black,
      ),
    );
  }
}
