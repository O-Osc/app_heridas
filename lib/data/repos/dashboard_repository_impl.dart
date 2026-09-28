import '../../domain/entities/cita.dart';
import '../../domain/entities/dashboard_stats.dart';
import '../../domain/entities/paciente.dart';
import 'package:app_heridas/domain/repositories/contrato.dart';

 
/// Implementación concreta del repositorio.
/// Aquí es donde, en un caso real, se llamaría a una API o base de datos.
/// Por ahora devuelve datos de ejemplo (mock).
class DashboardRepositoryImpl implements DashboardRepository {
  @override
  DashboardStats obtenerEstadisticas() {
    return const DashboardStats(totalPacientes: 24, citasHoy: 2);
  }
 
  @override
  List<CitaHoyQA> obtenerCitasDeHoy() {
    return const [
      CitaHoyQA(
        hora: '09:00',
        nombrePaciente: 'María González',
        descripcion: 'Control semanal de úlcera p...',
      ),
      CitaHoyQA(
        hora: '10:30',
        nombrePaciente: 'Carlos Rodríguez',
        descripcion: 'Cambio de apósito hidrocol...',
      ),
    ];
  }
 
  @override
  List<PacienteReciente> obtenerPacientesRecientes() {
    return const [
      PacienteReciente(
        nombre: 'María González',
        diagnostico: 'Pie diabético',
        edad: 67,
        fechaUltimaVisita: '23 jun',
        activo: true,
      ),
      PacienteReciente(
        nombre: 'Carlos Rodríguez',
        diagnostico: 'Úlcera venosa',
        edad: 58,
        fechaUltimaVisita: '21 jun',
        activo: true,
      ),
    ];
  }
}