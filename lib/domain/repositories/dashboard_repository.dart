import '../entities/dashboard_stats.dart';
 
/// Contrato, datos que se necesitan
abstract class DashboardRepository {
  Future<DashboardStats> obtenerEstadisticas();
  // List<Cita> obtenerCitasDeHoy();                   estas van en otro contrato
  // List<Paciente> obtenerPacientesRecientes();
}