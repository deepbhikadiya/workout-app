import 'package:ft_task/package/config_packages.dart';

import '../../../../package/screen_packages.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> {
  @override
  Widget build(BuildContext context) {
    return _myAppointments();
  }

  Column _myAppointments() {
    final homeController = Get.find<HomeController>();
    return Column(
      children: [
        StreamBuilder(
          stream:
              homeController.viewAllAppoinment.value ? FirebaseFirestore.instance.collection("appointments").snapshots() : FirebaseFirestore.instance.collection("appointments").limit(2).snapshots(),
          builder: (
            BuildContext context,
            snapshot,
          ) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            List<DocumentSnapshot> documents = snapshot.data!.docs;
            return AnimatedCrossFade(
              firstChild: _buildList1(documents),
              secondChild: _buildList1(documents),
              crossFadeState: homeController.viewAllAppoinment.value ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            );
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Obx(
          () => CommonAppButton(
            onTap: () {
              homeController.viewAllAppoinment.value = !homeController.viewAllAppoinment.value;
              setState(() {});
            },
            text: homeController.viewAllAppoinment.value ? "View Less" : "View All",
            buttonType: ButtonType.enable,
            height: 30,
            width: 120,
          ),
        )
      ],
    );
  }

  Widget _buildList1(List<DocumentSnapshot> documents) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      physics: const ScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: documents.length,
      itemBuilder: (context, index) {
        var snapshot = documents[index];
        return FadeTransition(
          opacity: const AlwaysStoppedAnimation(1.0),
          // Adjust this if you want a fade effect
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: [
                const Color(0xFFC6D9FF),
                const Color(0xFFE9C6FF),
                const Color(0xFFFFD4C6),
              ][index],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getImageView(
                  finalUrl: snapshot['image_path'],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  snapshot['title'],
                  textAlign: TextAlign.center,
                  style: const TextStyle().normal14w600.textColor(
                        AppColor.primaryBlackColor1,
                      ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
