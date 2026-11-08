import 'package:flutter/material.dart';

import '../../../Widget/CustomText.dart';
import '../../../Widget/WoundEvolutionChart.dart';

class StatisticsTab extends StatelessWidget {
  const StatisticsTab({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isSmallScreen = screenWidth < 360;

    final horizontalPadding = (screenWidth * 0.05).clamp(16.0, 24.0);
    final avatarRadius = (screenWidth * 0.10).clamp(32.0, 45.0);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Customtext(text: '8.2 cm', fontSize: isSmallScreen ? 10 : 20),
                Customtext(
                  text: 'Area Inicial',
                  fontSize: isSmallScreen ? 10 : 14,
                ),
              ],
            ),
            Column(
              children: [
                Customtext(text: '8.2 cm', fontSize: isSmallScreen ? 10 : 20),
                Customtext(
                  text: 'Area Actual',
                  fontSize: isSmallScreen ? 10 : 14,
                ),
              ],
            ),
            Column(
              children: [
                Customtext(
                  text: '-42%',
                  fontSize: isSmallScreen ? 10 : 20,
                  textColor: Colors.green,
                ),
                Customtext(
                  text: 'Reduccion total',
                  fontSize: isSmallScreen ? 10 : 14,
                ),
              ],
            ),
          ],
        ),
        Expanded(flex: 4, child: WoundEvolutionScreen()),
      ],
    );
  }
}
