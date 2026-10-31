import 'package:flutter/material.dart';
import '../colors_app.dart';

class CustomPickerInput extends StatefulWidget {
  const CustomPickerInput({super.key});

  @override
  State<CustomPickerInput> createState() => _CustomPickerInputState();
}

class _CustomPickerInputState extends State<CustomPickerInput> {
  final TextEditingController _dateController = TextEditingController();

  DateTime? _selectedDate;

  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$month/$day/${date.year}';
  }

  // Abrir calendario
  Future<void> _selectDate() async {
    final now = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: _selectedDate ?? DateTime(now.year, now.month, now.day),

      firstDate: DateTime(2000),
      lastDate: now,

      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,

      locale: const Locale('en', 'US'),

      helpText: 'DD / MM / YYYY',
      cancelText: 'Cancel',
      confirmText: 'OK',

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.verdeClaro),
          ),
          child: child!,
        );
      },
    );

    // Actualizar cuando el usuario confirma
    if (pickedDate != null && mounted) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = _formatDate(pickedDate);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _dateController,
        readOnly: true,
        onTap: _selectDate,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'MM / DD / YYYY',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.greyTextBox),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.greyTextBox),
          ),
          suffixIcon: Icon(Icons.calendar_month),
        ),
      );
  }
}
