import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
 
/// Título de una sección, con un texto de acción opcional a la derecha
/// (por ejemplo "Ver todas" / "Ver todos").
class SectionTitle extends StatelessWidget {
  final String titulo;
  final String? actionText;
  final VoidCallback? onActionPressed;
 
  const SectionTitle({
    super.key,
    required this.titulo,
    this.actionText,
    this.onActionPressed,
  });
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        if (actionText != null)
          GestureDetector(
            onTap: onActionPressed,
            child: Text(
              actionText!,
              style: const TextStyle(
                color: AppColors.verdeClaro,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}