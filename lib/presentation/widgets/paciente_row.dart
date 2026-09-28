import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/entities/paciente.dart';
 
/// Fila que muestra la información resumida de un paciente reciente.
class PacienteRow extends StatelessWidget {
  final PacienteReciente paciente;
 
  const PacienteRow({super.key, required this.paciente});
 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFFE0E0E0),
          radius: 20,
          child: Icon(Icons.person_outline, color: Colors.grey),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paciente.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 2),
              Text(
                paciente.infoResumen,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (paciente.activo)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.estadoActivoFondo,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Activo',
                  style: TextStyle(
                    color: AppColors.estadoActivoTexto,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            const SizedBox(height: 4),
            Text(
              paciente.fechaUltimaVisita,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}