import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../domain/entities/dashboard_stats.dart';
import 'stat_card.dart';
 
/// Encabezado verde con el saludo, el botón de logout y las estadísticas.
class HeaderSection extends StatelessWidget {
  final String nombreDoctor;
  final DashboardStats stats;
  final VoidCallback? onLogoutPressed;
 
  const HeaderSection({
    super.key,
    required this.nombreDoctor,
    required this.stats,
    this.onLogoutPressed,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        color: AppColors.verdeOscuro,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Buenos días, $nombreDoctor',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onLogoutPressed,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withValues(alpha: 0.15),
                  radius: 20,
                  child: const Icon(Icons.logout, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: StatCard(
                  icon: Icons.groups_outlined,
                  value: '${stats.totalPacientes}',
                  label: 'Pacientes',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  icon: Icons.calendar_today_outlined,
                  value: '${stats.citasHoy}',
                  label: 'Citas hoy',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}