import 'package:ft_task/package/config_packages.dart';
import 'package:ft_task/package/screen_packages.dart';

class AssessmentDetailScreen extends StatefulWidget {
  final dynamic data;
  final dynamic keyb;

  const AssessmentDetailScreen({super.key, this.data, this.keyb});

  @override
  State<AssessmentDetailScreen> createState() => _AssessmentDetailScreenState();
}

class _AssessmentDetailScreenState extends State<AssessmentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding:
                      const EdgeInsets.only(bottom: 0.0, right: 20, left: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        const Color(0xFF91B655).withOpacity(.5),
                        const Color(0xFF69F5BB).withOpacity(.5),
                      ],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${widget.data['title']}",
                              style: const TextStyle().normal24w600.textColor(
                                    AppColor.primaryBlackColor1,
                                  ),
                            ),
                            const SizedBox(
                              height: 14,
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
                                        AppImage.timerIcon,
                                        height: 13,
                                        color: AppColor.primaryBlackColor1,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        widget.data['duration'],
                                        style: const TextStyle()
                                            .normal12w600
                                            .textColor(
                                              AppColor.primaryBlackColor1,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      Hero(
                        tag: widget.keyb,
                        // Ensure this matches the one in the ListView
                        child: getImageView(
                          finalUrl: widget.data['image_path'],
                          fit: BoxFit.cover,
                          height: 200,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(24),
              //   topRight: Radius.circular(24),
              // ),
              ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: widget.data['what_do_you_get'].isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What do you get ? ",
                        style: const TextStyle().normal16w500.textColor(
                              AppColor.primaryBlackColor1,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 15,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.data['what_do_you_get'].length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 60,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(17),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: AppColor.borderColor2,
                                      ),
                                    ),
                                    child: getImageView(
                                      finalUrl: widget.data['what_do_you_get']
                                          [index]['image'],
                                      fit: BoxFit.contain,
                                      height: 29,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.data['what_do_you_get'][index]
                                          ['title'],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle()
                                          .normal10w600
                                          .textColor(AppColor.titleColor),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text(
                          "How we do it? ",
                          style: const TextStyle().normal16w500.textColor(
                                AppColor.primaryBlackColor1,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Image.asset(
                          AppImage.roundBg,
                          height: 140,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColor.bgColor,
                        border:
                            Border.all(width: 2, color: AppColor.borderColor2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 160.0),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.greenColor1.withOpacity(.1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    AppImage.shieldIcon,
                                    height: 15,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "We do not store or share your personal data",
                                    style: const TextStyle()
                                        .normal11w500
                                        .textColor(
                                          AppColor.grey70Color,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 14),
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: widget.data['how_we_do_it'].length,
                              itemBuilder: (context, index) {
                                return Text(
                                  '${index + 1}) ${widget.data['how_we_do_it'][index]}',
                                  textAlign: TextAlign.start,
                                  style: const TextStyle()
                                      .normal12w400
                                      .textColor(AppColor.black),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Image.asset(
                        AppImage.assestmentBg,
                        height: 182,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
