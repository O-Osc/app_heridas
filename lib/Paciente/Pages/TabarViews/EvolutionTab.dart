import 'package:flutter/material.dart';

import '../../../Widget/CustomButton.dart';
import '../../../Widget/CustomEvolutionCard.dart';
import '../../../core/colors_app.dart';

class EvolutionTab extends StatelessWidget {
  final List<WoundEvolutionModel> evolutions;
  final VoidCallback? onNewEvolutionPressed;
  const EvolutionTab({
    super.key,
    required this.evolutions,
    this.onNewEvolutionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.sort, size: 18, color: Colors.grey.shade700),
                      const SizedBox(width: 8),
                      Text(
                        'Más recientes',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.tune, color: Colors.teal.shade700),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: evolutions.length,
                itemBuilder: (context, index) {
                  return CustomEvolutionCard(
                    evolution: evolutions[index],
                    onTap: () {
                      // Acción al presionar una tarjeta individual
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsetsGeometry.directional(end: 20, start: 20),
              child: Custombutton(
                texto: '+ Nueva Evolucion',
                colorBorder: AppColors.verdeOscuro,
                onPressed: () {
                  //context.push('/evolution-new');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
