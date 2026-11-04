import 'package:app_heridas/Widget/CustomFilterGroup.dart';
import 'package:app_heridas/core/colors_app.dart';
import 'package:flutter/material.dart';

class PacientFilters {
  static const String todos = 'Todos';
  static const String ultimaSemana = 'Última semana';
  static const String ultimoMes = 'Último mes';

  static const List<String> diagnosticos = [
    'Pie diabético',
    'Úlcera venosa',
    'Úlcera por presión',
  ];

  static const List<String> generos = [todos, 'Femenino', 'Masculino'];
  static const List<String> revisiones = [
    ultimaSemana,
    ultimoMes,
  ];

  final String? diagnostico; 
  final String genero; 
  final String? revision;

  const PacientFilters({
    this.diagnostico,
    this.genero = todos,
    this.revision,
  });
}

class CustomFilterPanel extends StatefulWidget {
  final PacientFilters initialFilters;
  final ValueChanged<PacientFilters> onApply;
  final VoidCallback onClear;

  const CustomFilterPanel({
    super.key,
    this.initialFilters = const PacientFilters(),
    required this.onApply,
    required this.onClear,
  });

  @override
  State<CustomFilterPanel> createState() => _CustomFilterPanelState();
}

class _CustomFilterPanelState extends State<CustomFilterPanel> {
  late String? _diagnostico;
  late String _genero;
  late String? _revision;

  @override
  void initState() {
    super.initState();
    _diagnostico = widget.initialFilters.diagnostico;
    _genero = widget.initialFilters.genero;
    _revision = widget.initialFilters.revision;
  }

  void _limpiar() {
    setState(() {
      _diagnostico = null;
      _genero = PacientFilters.todos;
      _revision = null;
    });
    widget.onClear();
  }

  void _aplicar() {
    widget.onApply(
      PacientFilters(
        diagnostico: _diagnostico,
        genero: _genero,
        revision: _revision,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greyTextBox),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFilterGroup(
            title: 'Diagnóstico',
            options: PacientFilters.diagnosticos,
            selected: _diagnostico,
            allowDeselect: true,
            onChanged: (valor) => setState(() => _diagnostico = valor),
          ),
          const SizedBox(height: 16),
          CustomFilterGroup(
            title: 'Género',
            options: PacientFilters.generos,
            selected: _genero,
            onChanged: (valor) =>
                setState(() => _genero = valor ?? PacientFilters.todos),
          ),
          const SizedBox(height: 16),
          CustomFilterGroup(
            title: 'Última revisión',
            options: PacientFilters.revisiones,
            selected: _revision,
            allowDeselect: true,
            onChanged: (valor) => setState(() => _revision = valor),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _limpiar,
                child: Text(
                  'Limpiar',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _aplicar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.verdeOscuro,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Aplicar filtros',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}