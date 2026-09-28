/// Representa una cita médica dentro del dominio de la app.
class CitaHoyQA {
  final String hora;
  final String nombrePaciente;
  final String descripcion;
 
  const CitaHoyQA({
    required this.hora,
    required this.nombrePaciente,
    required this.descripcion,
  });
}