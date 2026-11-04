
class Paciente {
  final String nombre;
  final int fechaNacimiento;
  final String sexo;
  final String numeroDocumento;
  final String telefono;
  final String diagnostico;
  final String eps;
 
  const Paciente({
    required this.nombre,
    required this.diagnostico,
    required this.fechaNacimiento,
    required this.sexo,
    required this.numeroDocumento,
    required this.telefono,
    required this.eps,  
  });
 
  int _calcularEdad() {
    final now = DateTime.now();
    final birthDate = DateTime.fromMillisecondsSinceEpoch(fechaNacimiento);
    int edad = now.year - birthDate.year;
    if (now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day)) {
      edad--;
    }
    return edad;
  }

  int get edad => _calcularEdad();
}
 