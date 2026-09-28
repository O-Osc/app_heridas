import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
 
/// Fila con las tres tarjetas de acciones rápidas del dashboard.
class QuickActionsRow extends StatelessWidget {
  final VoidCallback? onPacientesPressed;
  final VoidCallback? onNuevoPacientePressed;
  final VoidCallback? onAgendaPressed;
 
  const QuickActionsRow({
    super.key,
    this.onPacientesPressed,
    this.onNuevoPacientePressed,
    this.onAgendaPressed,
  });
 
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickActionCard(
            icon: Icons.groups_outlined,
            label: 'Pacientes',
            bgColor: AppColors.chipPacienteFondo,
            iconBgColor: AppColors.verdeOscuro,
            onTap: onPacientesPressed,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _QuickActionCard(
            icon: Icons.add,
            label: 'Nuevo paciente',
            bgColor: AppColors.chipNuevoPacienteFondo,
            iconBgColor: AppColors.iconNuevoPaciente,
            onTap: onNuevoPacientePressed,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _QuickActionCard(
            icon: Icons.calendar_month_outlined,
            label: 'Agenda',
            bgColor: AppColors.chipAgendaFondo,
            iconBgColor: AppColors.iconAgenda,
            onTap: onAgendaPressed,
          ),
        ),
      ],
    );
  }
}
 
/// Tarjeta individual de acción rápida (privada de este archivo).
class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bgColor;
  final Color iconBgColor;
  final VoidCallback? onTap;
 
  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.bgColor,
    required this.iconBgColor,
    this.onTap,
  });
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: iconBgColor,
              radius: 20,
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}