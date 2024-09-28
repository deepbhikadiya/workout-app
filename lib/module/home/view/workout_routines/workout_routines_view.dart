import 'package:ft_task/package/config_packages.dart';
import 'package:ft_task/package/screen_packages.dart';

class WorkoutRoutinesView extends StatelessWidget {
  const WorkoutRoutinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  _buildWorkoutRoutines();
  }

  SizedBox _buildWorkoutRoutines() {
    return SizedBox(
      height: 116,
      child: FirestoreAnimatedList(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        query: FirebaseFirestore.instance.collection("workout routines"),
        itemBuilder: (
            BuildContext context,
            snapshot,
            Animation<double> animation,
            int index,
            ) =>
            FadeTransition(
              opacity: animation,
              child: Container(
                margin: const EdgeInsets.only(
                  right: 12,
                ),
                height: 116,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColor.borderColor,
                  ),
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(21),
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
                          topLeft: Radius.circular(21),
                          bottomLeft: Radius.circular(21),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(21),
                          bottomLeft: Radius.circular(21),
                        ),
                        child: getImageView(
                          finalUrl: snapshot?['image_path'],
                          height: 116,
                          width: 107,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot?['title'],
                              style: const TextStyle().normal14w500.textColor(
                                AppColor.titleColor,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              snapshot?['workout_type'],
                              style: const TextStyle().normal10w400.textColor(
                                AppColor.darkGreyColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColor.borderColor,
                                  )),
                              child: Text(
                                snapshot?['category'],
                                style: const TextStyle().normal10w600.textColor(
                                  AppColor.primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Difficulty",
                                  style: const TextStyle().normal10w400.textColor(
                                    AppColor.darkGreyColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  snapshot?['difficulty'],
                                  style: const TextStyle().normal10w600.textColor(
                                    AppColor.lightPinkColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      ),
    );
  }

}
