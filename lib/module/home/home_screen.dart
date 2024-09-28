
import 'package:ft_task/package/config_packages.dart';
import 'package:ft_task/package/screen_packages.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          children: [
            _tabBarView(),
            _tabBarBody(),
            _buildHeader(title: "Challenges"),
            const ChallengesView(),
            _buildHeader(title: "Workout Routines"),
            const WorkoutRoutinesView(),
          ],
        ),
      ),
    );
  }




  Padding _buildHeader({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle().normal14w600.textColor(
                    AppColor.black,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "View All",
                style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColor.black,
                        decorationColor: AppColor.black)
                    .normal12w500
                    .textColor(
                      AppColor.primaryBlackColor1,
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  color: AppColor.darkBlueColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppImage.nextArrowIcon,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Obx _tabBarBody() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.lightPrimaryColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            [
               const AssessmentsView(),
              const AppointmentsView(),
            ][homeController.selectedIndex.value],
          ],
        ),
      ),
    );
  }

  Container _tabBarView() {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.lightPrimaryColor,
      ),
      child: Obx(() {
        return Row(
            children: List.generate(
          homeController.tabList.length,
          (i) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  if (i == 0) {
                    homeController.viewAllAssetment.value = false;
                  } else {
                    homeController.viewAllAppoinment.value = false;
                  }

                  homeController.selectedTab.value = homeController.tabList[i];
                  homeController.selectedIndex.value = i;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.only(right: i == 0 ? 10 : 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: homeController.selectedTab.value ==
                            homeController.tabList[i]
                        ? AppColor.white
                        : AppColor.lightPrimaryColor,
                  ),
                  child: Text(
                    homeController.tabList[i],
                    style: const TextStyle().normal14w600.textColor(
                          homeController.selectedTab.value ==
                                  homeController.tabList[i]
                              ? AppColor.primaryColor
                              : AppColor.lightGrayColor,
                        ),
                  ),
                ),
              ),
            );
          },
        ));
      }),
    );
  }

  CommonAppBar _appBar() {
    return CommonAppBar(
      leadingWidth: 20,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text(
        "Hello Jane",
        style: const TextStyle().normal24w600.textColor(AppColor.primaryColor),
      ),
      action: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: AppColor.darkGrayColor,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(2),
          height: 26,
          width: 26,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.darkGrayColor,
          ),
          child: Image.asset(
            AppImage.userIcon,
          ),
        ),
      ),
    );
  }
}
