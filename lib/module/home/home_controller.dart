import 'package:ft_task/package/config_packages.dart';

class HomeController extends GetxController{
  RxList<String> tabList = <String>[
    "My Assessments",
    "My Appointments",
  ].obs;
  RxString selectedTab = "My Assessments".obs;
  RxInt selectedIndex = 0.obs;
  RxBool viewAllAssetment = false.obs;
  RxBool viewAllAppoinment = false.obs;

}