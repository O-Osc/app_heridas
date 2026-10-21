/// Representa a un paciente dentro del dominio de la app.
class PacienteReciente {
  final String nombre;
  final String diagnostico;
  final int edad;
  final String fechaUltimaVisita;
  final bool activo;
 
  const PacienteReciente({
    required this.nombre,
    required this.diagnostico,
    required this.edad,
    required this.fechaUltimaVisita,
    required this.activo,
  });
 
  String get infoResumen => '$diagnostico · $edad años';
}