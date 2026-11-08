import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WoundEvolutionScreen extends StatelessWidget {
  const WoundEvolutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos dimensiones con MediaQuery para adaptar la altura del gráfico si es necesario
    final size = MediaQuery.of(context).size;
    final chartHeight = size.height * 0.35; // 35% de la altura de la pantalla

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Perfil de Paciente - Evolución'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 1. Contenido desplazable (Evita desbordamientos verticales)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tarjeta contenedora del gráfico
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'mm²',
                            style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: chartHeight > 220 ? chartHeight : 220,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: true,
                                  drawVerticalLine: false,
                                  getDrawingHorizontalLine: (value) => FlLine(
                                    color: Colors.grey.shade200,
                                    strokeWidth: 1,
                                  ),
                                ),
                                titlesData: FlTitlesData(
                                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 28,
                                      getTitlesWidget: (value, meta) {
                                        return Text(
                                          value.toInt().toString(),
                                          style: const TextStyle(color: Colors.grey, fontSize: 10),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 28,
                                      interval: 1,
                                      getTitlesWidget: (value, meta) {
                                        switch (value.toInt()) {
                                          case 1: return const Text('Enero', style: TextStyle(fontSize: 10));
                                          case 2: return const Text('Marzo', style: TextStyle(fontSize: 10));
                                          case 3: return const Text('Mayo', style: TextStyle(fontSize: 10));
                                          case 4: return const Text('Julio', style: TextStyle(fontSize: 10));
                                          case 5: return const Text('Sep', style: TextStyle(fontSize: 10));
                                          case 6: return const Text('Nov', style: TextStyle(fontSize: 10));
                                          default: return const Text('');
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(show: false),
                                minX: 1,
                                maxX: 6,
                                minY: 2,
                                maxY: 8,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: const [FlSpot(1, 1), FlSpot(2, 2), FlSpot(3, 4), FlSpot(4, 5), FlSpot(5, 8), FlSpot(6, 8)],
                                    isCurved: true,
                                    color: Colors.pinkAccent,
                                    barWidth: 3,
                                    dotData: const FlDotData(show: false),
                                  ),
                                  LineChartBarData(
                                    spots: const [FlSpot(1, 6), FlSpot(2, 6), FlSpot(3, 3), FlSpot(4, 2), FlSpot(5, 1), FlSpot(6, 0.5)],
                                    isCurved: true,
                                    color: Colors.amber,
                                    barWidth: 3,
                                    dotData: const FlDotData(show: false),
                                  ),
                                  LineChartBarData(
                                    spots: const [FlSpot(1, 6), FlSpot(2, 8), FlSpot(3, 5), FlSpot(4, 3), FlSpot(5, 2), FlSpot(6, 4)],
                                    isCurved: true,
                                    color: Colors.blueGrey,
                                    barWidth: 3,
                                    dotData: const FlDotData(show: false),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Leyenda usando Wrap para pantallas pequeñas
                          Wrap(
                            spacing: 16,
                            runSpacing: 8,
                            children: const [
                              _LegendItem(color: Colors.pinkAccent, label: 'Tejido epitelial'),
                              _LegendItem(color: Colors.amber, label: 'Tejido esfacelado'),
                              _LegendItem(color: Colors.blueGrey, label: 'Tejido necrótico'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Tarjeta de tendencia de mejora (extraída del diseño de Figma)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2F4F0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00897B),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.show_chart, color: Colors.white, size: 20),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Tendencia de mejora sostenida: reducción promedio de 0.7 cm² por semana.',
                              style: TextStyle(
                                color: Color(0xFF004D40),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.black87)),
      ],
    );
  }
}