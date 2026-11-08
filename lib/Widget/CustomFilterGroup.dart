import 'package:app_heridas/Widget/CustomFilterChip.dart';
import 'package:flutter/material.dart';

class CustomFilterGroup extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? selected;
  final ValueChanged<String?> onChanged;

  final bool allowDeselect;

  const CustomFilterGroup({
    super.key,
    required this.title,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.allowDeselect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((opcion) {
            final bool esSeleccionada = opcion == selected;
            return CustomFilterChip(
              label: opcion,
              compact: true,
              selected: esSeleccionada,
              onTap: () {
                if (esSeleccionada && allowDeselect) {
                  onChanged(null);
                } else {
                  onChanged(opcion);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}