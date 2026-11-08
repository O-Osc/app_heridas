import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/colors_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buenos días, Dra. Sanchez",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.verdeOscuro,
        actions: <Widget>[
          OutlinedButton(
            onPressed: () {
              context.go('/');
            },
            style: OutlinedButton.styleFrom(side: BorderSide.none),
            child: Icon(Icons.logout, color: Colors.white, size: 20),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Acciones rápidas',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  _buildQuickActions(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Encabezado ----------
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(color: AppColors.verdeOscuro),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _statCard(
                  icon: Icons.groups_outlined,
                  value: '24',
                  label: 'Pacientes',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _statCard(
                  icon: Icons.calendar_today_outlined,
                  value: '2',
                  label: 'Citas hoy',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.verdeClaro,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // ---------- Acciones rápidas ----------
  Widget _buildQuickActions(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: _quickActionCard(
            icon: Icons.groups_outlined,
            label: 'Pacientes',
            bgColor: const Color(0xFFDCEFEA),
            iconBgColor: AppColors.verdeOscuro,
            onPressed: () {
              context.push('/patient-list');
            },
          ),
        ),
        const SizedBox(height: 15),

        Row(
          children: [
            Expanded(
              child: _quickActionCard(
                icon: Icons.add,
                label: 'Nuevo paciente',
                bgColor: const Color(0xFFDFF3E3),
                iconBgColor: AppColors.verdeClaro,
                onPressed: () {
                  context.push('/patient-new');
                },
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _quickActionCard(
                icon: Icons.calendar_month_outlined,
                label: 'Agenda',
                bgColor: const Color(0xFFFBE9D0),
                iconBgColor: const Color(0xFFE0A030),
                onPressed: () {
                  context.push('/patient-new');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _quickActionCard({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color iconBgColor,
    required Function() onPressed,
  }) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: iconBgColor,
              radius: 20,
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
