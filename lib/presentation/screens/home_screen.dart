import 'package:flutter/material.dart';
import '../../data/repos/dashboard_repository_impl.dart';
import '../../domain/usecases/get_dashboard_data.dart';
import '../widgets/cita_card.dart';
import '../widgets/header_section.dart';
import '../widgets/paciente_row.dart';
import '../widgets/quick_actions_row.dart';
import '../widgets/section_title.dart';
 
/// Pantalla principal del dashboard.
/// Solo se encarga de componer widgets y pedir datos al caso de uso,
/// no contiene lógica de negocio ni acceso a datos directamente.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    // En una app real, esto se inyectaría con un provider/riverpod/get_it,
    // en vez de crearse aquí directamente.
    final getDashboardData = GetDashboardData(DashboardRepositoryImpl());
    final data = getDashboardData();
 
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(
                nombreDoctor: 'Dra. Sánchez',
                stats: data.stats,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(titulo: 'Acciones rápidas'),
                    const SizedBox(height: 12),
                    const QuickActionsRow(),
                    const SizedBox(height: 24),
                    const SectionTitle(
                      titulo: 'Citas de hoy',
                      actionText: 'Ver todas',
                    ),
                    const SizedBox(height: 12),
                    ...data.citas.map(
                      (cita) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CitaCard(cita: cita),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const SectionTitle(
                      titulo: 'Pacientes recientes',
                      actionText: 'Ver todos',
                    ),
                    const SizedBox(height: 12),
                    ...data.pacientes.map(
                      (paciente) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: PacienteRow(paciente: paciente),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}