import '../entities/cita.dart';
import '../entities/dashboard_stats.dart';
import '../entities/paciente.dart';
 
/// Contrato que define qué datos necesita el dominio,
/// sin importar de dónde vengan (API, base de datos local, etc.).
abstract class DashboardRepository {
  DashboardStats obtenerEstadisticas();
  List<CitaHoyQA> obtenerCitasDeHoy();
  List<PacienteReciente> obtenerPacientesRecientes();
}