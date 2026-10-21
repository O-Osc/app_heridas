import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
 
/// Tarjeta pequeña que muestra un ícono, un valor grande y una etiqueta.
class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
 
  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.verdeClaro,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}