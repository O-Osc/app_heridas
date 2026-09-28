import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/entities/cita.dart';
 
/// Tarjeta que muestra la hora, el nombre del paciente y la descripción
/// de una cita del día.
class CitaCard extends StatelessWidget {
  final CitaHoyQA cita;
 
  const CitaCard({super.key, required this.cita});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              const Icon(Icons.access_time, size: 16, color: AppColors.verdeClaro),
              const SizedBox(height: 2),
              Text(
                cita.hora,
                style: const TextStyle(fontSize: 12, color: AppColors.verdeClaro),
              ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cita.nombrePaciente,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 2),
                Text(
                  cita.descripcion,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}