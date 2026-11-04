import 'package:flutter_svg/svg.dart';
import 'package:material_ui/material_ui.dart';

class CustomInitApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/CuadroIcono.svg', width: 60, height: 60),
          const SizedBox(height: 16),
          const Text(
            'WoundsApp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Sistema clínico de seguimiento de heridas',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
