import 'package:app_heridas/core/colors_app.dart';
import 'package:flutter/material.dart';

class CustomPacientCard extends StatelessWidget {
  final String nombre;
  final int edad;
  final String sexo;
  final String diagnostico;
  final String ultimaRevision;
  final VoidCallback? onTap;

  const CustomPacientCard({
    super.key,
    required this.nombre,
    required this.edad,
    required this.sexo,
    required this.diagnostico,
    required this.ultimaRevision,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(color: AppColors.greyTextBox),
    );

    return Material(
      color: Colors.white,
      shape: shape,
      child: InkWell(
        customBorder: shape,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.verdeClaro.withValues(alpha: 0.15),
                child: const Icon(
                  Icons.person_outline,
                  color: AppColors.verdeOscuro,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '$edad años · $sexo',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    _infoRow(Icons.attach_file, diagnostico),
                    const SizedBox(height: 2),
                    _infoRow(Icons.access_time, 'Última revisión: $ultimaRevision'),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey.shade500),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icono, String texto) {
    return Row(
      children: [
        Icon(icono, size: 14, color: Colors.grey.shade600),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            texto,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
          ),
        ),
      ],
    );
  }
}