import '../entities/dashboard_stats.dart';
import '../repositories/dashboard_repository.dart';
 
class DashboardData {
  final DashboardStats stats;
 
  const DashboardData({
    required this.stats,
  });
}

class GetDashboardData {
  final DashboardRepository repository;
 
  const GetDashboardData(this.repository);

Future<DashboardData> call() async {
	final stats = await repository.obtenerEstadisticas();
	  return DashboardData(
	  stats: stats,
	);
}    
  
}
 