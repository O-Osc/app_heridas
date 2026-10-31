class Paciente {
  final String nombre;
  final String fechaNacimiento;
  final String sexo;
  final String numdocumento;
  final String numtelefono;
  final String eps;
  final String diagnostico;
  final String antecedentes;
 
  const Paciente({
    required this.nombre,
    required this.fechaNacimiento,
    required this.sexo,
    required this.numdocumento,
    required this.numtelefono,
    required this.eps,
    required this.diagnostico,
    required this.antecedentes,
  });

//  int getEdad() {
//     final fechaNacimientoDate = DateTime.parse(fechaNacimiento);
//     final now = DateTime.now();
//     int edad = now.year - fechaNacimientoDate.year;
//     if (now.month < fechaNacimientoDate.month ||
//         (now.month == fechaNacimientoDate.month &&
//             now.day < fechaNacimientoDate.day)) {
//       edad--;
//     }
//     return edad;
//   }

}

