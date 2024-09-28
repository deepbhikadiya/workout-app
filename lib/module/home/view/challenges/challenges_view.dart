import 'package:ft_task/package/config_packages.dart';
import 'package:ft_task/package/screen_packages.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  _buildChallenges();
  }

  SizedBox _buildChallenges() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 6,
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: AppColor.lightGreenColor,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 160,
            width: 338,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    AppImage.challangeImageBg,
                    height: 85,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today’s Challenge!",
                        style: const TextStyle().normal16w600.textColor(
                          AppColor.greenColor,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CommonAppButton(
                        text: "Push Up 20x",
                        style: const TextStyle()
                            .normal10w500
                            .textColor(AppColor.white),
                        buttonType: ButtonType.enable,
                        height: 22,
                        width: 84,
                        color: AppColor.greenColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 160,
                        child: LinearProgressBar(
                          minHeight: 9,
                          maxSteps: 6,
                          progressType: LinearProgressBar.progressTypeLinear,
                          currentStep: 4,
                          progressColor: AppColor.lightPinkColor,
                          backgroundColor: AppColor.white,
                          borderRadius: BorderRadius.circular(10), //  NEW
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "10/20",
                            style: const TextStyle().normal10w600.textColor(
                              AppColor.primaryBlackColor2,
                            ),
                          ),
                          Text(
                            " Complete",
                            style: const TextStyle().normal10w400.textColor(
                              AppColor.primaryBlackColor2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.white,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImage.playIcon,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Continue",
                                  style:
                                  const TextStyle().normal12w600.textColor(
                                    AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
