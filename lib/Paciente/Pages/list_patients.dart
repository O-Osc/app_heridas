import 'package:app_heridas/Widget/CustomButton.dart';
import 'package:app_heridas/Widget/CustomFilterChip.dart';
import 'package:app_heridas/Widget/CustomFilterPanel.dart';
import 'package:app_heridas/Widget/CustomPacientCard.dart';
import 'package:app_heridas/Widget/CustomScreenHeader.dart';
import 'package:app_heridas/Widget/CustomSearchField.dart';
import 'package:app_heridas/core/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Paciente {
  final String nombre;
  final int edad;
  final String sexo;
  final String diagnostico;
  final DateTime ultimaRevision;

  const Paciente({
    required this.nombre,
    required this.edad,
    required this.sexo,
    required this.diagnostico,
    required this.ultimaRevision,
  });
}

class ListPatients extends StatefulWidget {
  const ListPatients({super.key});

  @override
  State<ListPatients> createState() => _ListPatientsState();
}

class _ListPatientsState extends State<ListPatients> {
  // Fecha de referencia para "Última semana / Último mes".
  // En producción usa DateTime.now(); aquí es fija porque los datos son de ejemplo.
  final DateTime _fechaReferencia = DateTime(2026, 6, 22);

  final List<Paciente> _pacientes = [
    Paciente(
      nombre: 'Ana Martínez',
      edad: 72,
      sexo: 'Femenino',
      diagnostico: 'Pie diabético',
      ultimaRevision: DateTime(2026, 6, 19),
    ),
    Paciente(
      nombre: 'Carlos Rodríguez',
      edad: 54,
      sexo: 'Masculino',
      diagnostico: 'Úlcera venosa',
      ultimaRevision: DateTime(2026, 6, 21),
    ),
    Paciente(
      nombre: 'Carmen Díaz',
      edad: 58,
      sexo: 'Femenino',
      diagnostico: 'Pie diabético',
      ultimaRevision: DateTime(2026, 6, 14),
    ),
    Paciente(
      nombre: 'Luis Herrera',
      edad: 61,
      sexo: 'Masculino',
      diagnostico: 'Úlcera por presión',
      ultimaRevision: DateTime(2026, 6, 17),
    ),
  ];

  String _busqueda = '';
  bool _ordenarPorNombre = true;
  bool _filtrosAbiertos = false;
  PacientFilters _filtros = const PacientFilters();

  // ---------- Lógica de filtrado ----------
  bool _coincideRevision(Paciente p) {
    final int dias = _fechaReferencia.difference(p.ultimaRevision).inDays;
    switch (_filtros.revision) {
      case PacientFilters.ultimaSemana:
        return dias <= 7;
      case PacientFilters.ultimoMes:
        return dias <= 30;
      default:
        return true;
    }
  }

  List<Paciente> get _pacientesFiltrados {
    final String query = _busqueda.trim().toLowerCase();

    final List<Paciente> lista = _pacientes.where((p) {
      final bool coincideBusqueda =
          query.isEmpty ||
          p.nombre.toLowerCase().contains(query) ||
          p.diagnostico.toLowerCase().contains(query);
      final bool coincideDiagnostico =
          _filtros.diagnostico == null || p.diagnostico == _filtros.diagnostico;
      final bool coincideGenero =
          _filtros.genero == PacientFilters.todos || p.sexo == _filtros.genero;

      return coincideBusqueda &&
          coincideDiagnostico &&
          coincideGenero &&
          _coincideRevision(p);
    }).toList();

    if (_ordenarPorNombre) {
      lista.sort((a, b) => a.nombre.compareTo(b.nombre));
    }
    return lista;
  }

  String _formatearFecha(DateTime f) {
    const meses = [
      'ene',
      'feb',
      'mar',
      'abr',
      'may',
      'jun',
      'jul',
      'ago',
      'sep',
      'oct',
      'nov',
      'dic',
    ];
    return '${f.day} ${meses[f.month - 1]} ${f.year}';
  }

  // ---------- UI ----------
  @override
  Widget build(BuildContext context) {
    final List<Paciente> pacientes = _pacientesFiltrados;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        leadingWidth: 50,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: Icon(Icons.arrow_back, color: AppColors.verdeOscuro),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Pacientes',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.verdeOscuro,
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              context.push('/patient-new');
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.verdeOscuro,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.0,
              children: [
                Icon(Icons.add, color: AppColors.whiteBackground, size: 20),
                Text(
                  'Nuevo',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteBackground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CustomSearchField(
                  hintText: 'Buscar paciente o diagnóstico...',
                  onChanged: (valor) => setState(() => _busqueda = valor),
                ),
                const SizedBox(height: 14),

                // Fila: "Por nombre" + "Filtros"
                Row(
                  children: [
                    CustomFilterChip(
                      label: 'Por nombre',
                      selected: _ordenarPorNombre,
                      onTap: () => setState(
                        () => _ordenarPorNombre = !_ordenarPorNombre,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CustomFilterChip(
                      label: 'Filtros',
                      leadingIcon: Icons.filter_alt_outlined,
                      trailingIcon: _filtrosAbiertos
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      // Cuando está abierto: fondo verde claro translúcido
                      backgroundColor: _filtrosAbiertos
                          ? AppColors.verdeClaro.withValues(alpha: 0.15)
                          : null,
                      borderColor: _filtrosAbiertos
                          ? AppColors.verdeClaro.withValues(alpha: 0.15)
                          : null,
                      textColor: _filtrosAbiertos
                          ? AppColors.verdeOscuro
                          : null,
                      onTap: () =>
                          setState(() => _filtrosAbiertos = !_filtrosAbiertos),
                    ),
                  ],
                ),

                AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  alignment: Alignment.topCenter,
                  child: _filtrosAbiertos
                      ? Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: CustomFilterPanel(
                            initialFilters: _filtros,
                            onApply: (nuevos) => setState(() {
                              _filtros = nuevos;
                              _filtrosAbiertos = false;
                            }),
                            onClear: () => setState(
                              () => _filtros = const PacientFilters(),
                            ),
                          ),
                        )
                      : const SizedBox(width: double.infinity),
                ),

                const SizedBox(height: 16),

                // Listado
                if (pacientes.isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: Text(
                        'No se encontraron pacientes',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                  )
                else
                  ...pacientes.map(
                    (p) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CustomPacientCard(
                        nombre: p.nombre,
                        edad: p.edad,
                        sexo: p.sexo,
                        diagnostico: p.diagnostico,
                        ultimaRevision: _formatearFecha(p.ultimaRevision),
                        onTap: () {
                          // TODO: navegar al detalle del paciente
                          context.push('/ProfilePatient');
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
