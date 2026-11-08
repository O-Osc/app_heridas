import 'package:app_heridas/Login/Pages/Login.dart';
import 'package:app_heridas/Login/Pages/RegisterUser.dart';
import 'package:app_heridas/Paciente/Pages/add_patient.dart';
import 'package:app_heridas/Paciente/Pages/list_patients.dart';
import 'package:app_heridas/Paciente/Pages/profile_patient.dart';
import 'package:app_heridas/home/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Login()),
    GoRoute(
      path: '/login-register',
      builder: (context, state) => RegisterUser(),
    ),
    GoRoute(path: '/patient-new', builder: (context, state) => AddPatient()),
    GoRoute(path: '/patient-list', builder: (context, state) => ListPatients()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/ProfilePatient',
      builder: (context, state) => const ProfilePatient(),
    ),
  ],
);
