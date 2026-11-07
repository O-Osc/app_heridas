import 'package:app_heridas/core/colors_app.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class ProfilePatient extends StatefulWidget {
  const ProfilePatient({super.key});

  @override
  State<ProfilePatient> createState() => _ProfilePatientState();
}

class _ProfilePatientState extends State<ProfilePatient>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isSmallScreen = screenWidth < 360;

    final horizontalPadding = (screenWidth * 0.05).clamp(16.0, 24.0);
    final avatarRadius = (screenWidth * 0.10).clamp(32.0, 45.0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 50,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.verdeOscuro),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Perfil del paciente',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.verdeOscuro,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 20,
            ),
            color: AppColors.verdeOscuro,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: avatarRadius,
                      backgroundColor: AppColors.whiteBackground.withValues(
                        alpha: 0.20,
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.whiteBackground,
                        size: avatarRadius * 0.9,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ana Martínez",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 18 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "72 años · Femenino · Pie diabético",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isSmallScreen ? 13 : 15,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: _statCard(
                        value: '8',
                        label: 'Evoluciones',
                        isSmallScreen: isSmallScreen,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _statCard(
                        value: '105',
                        label: 'Días en tto.',
                        isSmallScreen: isSmallScreen,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _statCard(
                        value: '2 jul',
                        label: 'Próx. Cita',
                        isSmallScreen: isSmallScreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF00897B),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFF00897B),
              indicatorWeight: 4.0,
              tabs: const [
                Tab(text: 'Resumen'),
                Tab(text: 'Estadísticas'),
                Tab(text: 'Evolución'),
                Tab(text: 'Galería'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                //Pestaña 1: Informacion del paciente.
                Container(
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Información del paciente',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade200),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.03),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        child: Column(
                          children: [
                            _buildInfoRow(
                              icon: Icons.phone_outlined,
                              text: '+57 300 456 7890',
                            ),
                            _buildInfoRow(
                              icon: Icons.mail_outline,
                              text: 'ana.martinez@correo.com',
                            ),
                            _buildInfoRow(
                              icon: Icons.location_on_outlined,
                              text: 'Calle 45 #12-30, Valledupar',
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                // Pestaña 2: Estadísticas
                const Center(child: Text('Vista de Estadísticas')),
                // Pestaña 3: Evolución
                const Center(child: Text('Vista de Evolución')),
                // Pestaña 4: Galería
                const Center(child: Text('Vista de Galería')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard({
    required String value,
    required String label,
    required bool isSmallScreen,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteBackground.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 22 : 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: isSmallScreen ? 12 : 14,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF00897B).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF00897B),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
