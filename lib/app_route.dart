import 'package:ft_task/package/config_packages.dart';
import 'package:ft_task/package/screen_packages.dart';

class AppRouter {
  static const home = '/home';
  static const assessmentDetail = '/assessmentDetail';

  static List<GetPage> getPages = [
    GetPage(name: home, page: () =>  HomeScreen()),
    GetPage(name: assessmentDetail, page: () =>  const AssessmentDetailScreen()),
  ];
}
