import '../entities/cita.dart';
import '../entities/dashboard_stats.dart';
import '../entities/paciente.dart';
import 'contrato.dart';
 
/// Agrupa toda la información que necesita mostrar la pantalla principal.
/// entidad agregadora
class DashboardData {
  final DashboardStats stats;
  final List<CitaHoyQA> citas;
  final List<PacienteReciente> pacientes;
 
  const DashboardData({
    required this.stats,
    required this.citas,
    required this.pacientes,
  });
}
 
/// Caso de uso: obtiene los datos del dashboard desde el repositorio.
/// La capa de presentación no conoce el repositorio directamente,
/// solo conoce este caso de uso.
class GetDashboardData {
  final DashboardRepository repository;
 
  const GetDashboardData(this.repository);
 
  DashboardData call() {
    return DashboardData(
      stats: repository.obtenerEstadisticas(),
      citas: repository.obtenerCitasDeHoy(),
      pacientes: repository.obtenerPacientesRecientes(),
    );
  }
}