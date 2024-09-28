import 'package:ft_task/package/config_packages.dart';
import 'package:ft_task/package/screen_packages.dart';

class AssessmentsView extends StatefulWidget {
   const AssessmentsView({super.key});

  @override
  State<AssessmentsView> createState() => _AssessmentsViewState();
}

class _AssessmentsViewState extends State<AssessmentsView> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return _myAssessments();
  }

  Column _myAssessments() {

    return Column(
      children: [
        StreamBuilder(
          stream: homeController.viewAllAssetment.value
              ? FirebaseFirestore.instance.collection("assessment").snapshots()
              : FirebaseFirestore.instance
              .collection("assessment")
              .limit(2)
              .snapshots(),
          builder: (
              BuildContext context,
              snapshot,
              ) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            List<DocumentSnapshot> documents = snapshot.data!.docs;
            return AnimatedCrossFade(
              firstChild: _buildList(documents),
              secondChild: _buildList(documents),
              crossFadeState: homeController.viewAllAssetment.value
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
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
              homeController.viewAllAssetment.value =
              !homeController.viewAllAssetment.value;
              setState(() {});
            },
            text: homeController.viewAllAssetment.value
                ? "View Less"
                : "View All",
            buttonType: ButtonType.enable,
            height: 30,
            width: 120,
          ),
        )
      ],
    );
  }

  Widget _buildList(List<DocumentSnapshot> documents) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: documents.length,
      itemBuilder: (context, index) {
        var snapshot = documents[index];
        final keyb = UniqueKey();
        return FadeTransition(
          opacity: const AlwaysStoppedAnimation(1.0),
          // Adjust this if you want a fade effect
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AssessmentDetailScreen(
                  data: snapshot,
                  keyb: keyb,
                );
              }));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 6),
              height: 116,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          const Color(0xFFE36731).withOpacity(.5),
                          const Color(0xFFDABE5D).withOpacity(.5),
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: Hero(
                      tag: keyb,
                      child: getImageView(
                        finalUrl: snapshot['image_path'],
                        height: 116,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot['title'],
                            style: const TextStyle().normal14w600.textColor(
                              AppColor.primaryBlackColor1,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            // snapshot['description'],
                            "Identify and mitigate health risks with precise. proactive assessments.",
                            style: const TextStyle().normal10w500.textColor(
                              AppColor.primaryBlackColor2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Image.asset(AppImage.playIcon),
                              const SizedBox(width: 10),
                              Text(
                                "Start",
                                style: const TextStyle().normal14w600.textColor(
                                  AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
