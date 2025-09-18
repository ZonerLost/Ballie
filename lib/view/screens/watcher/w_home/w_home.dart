import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/watcher/w_home/w_all_leagues.dart';
import 'package:ballie/view/screens/watcher/w_home/w_league_matches.dart';
import 'package:ballie/view/screens/watcher/w_notifications/w_notifications.dart';
import 'package:ballie/view/screens/watcher/w_scan/w_scan.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/match_score_row_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WHome extends StatelessWidget {
  const WHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // appBar: AppBar(
        //   leadingWidth: 80,
        //   titleSpacing: 0,
        //   leading: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       CommonImageView(
        //         height: 40,
        //         width: 40,
        //         radius: 100,
        //         fit: BoxFit.cover,
        //         url: dummyImg,
        //       ),
        //     ],
        //   ),
        //   title: Column(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       MyText(
        //         text: 'Welcome Back!',
        //         size: 12,
        //         paddingBottom: 2,
        //         color: kQuaternaryColor,
        //       ),
        //       MyText(text: 'Jhon Doe', size: 14, weight: FontWeight.w600),
        //     ],
        //   ),
        //   actions: [
        //     Center(
        //       child: GestureDetector(
        //         onTap: () {
        //           Get.to(() => WScan());
        //         },
        //         child: Image.asset(Assets.imagesScan, height: 28),
        //       ),
        //     ),
        //     SizedBox(width: 10),

        //     Center(
        //       child: GestureDetector(
        //         onTap: () {
        //           Get.to(() => WNotifications());
        //         },
        //         child: Image.asset(Assets.imagesNotification, height: 32),
        //       ),
        //     ),
        //     SizedBox(width: 20),
        //   ],
        // ),
        appBar: AppBar(
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          title: MyText(text: 'Home'),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => WScan());
                },
                child: Image.asset(Assets.imagesScan, height: 28),
              ),
            ),
            SizedBox(width: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => WNotifications());
                },
                child: Image.asset(Assets.imagesNotification, height: 32),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),

        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            _HeadingTile(
              title: 'Leagues',
              onTap: () {
                Get.to(() => WAllLeagues());
              },
            ),
            SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 135,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                final List<String> images = [
                  Assets.imagesEpl,
                  Assets.imagesGb,
                  Assets.imagesCl,
                ];
                final List<String> titles = [
                  'English Premier League',
                  'German Bundesliga',
                  'UEFA Cham. League',
                ];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => WLeagueMatches());
                  },
                  child: BlurContainer(
                    radius: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonImageView(
                            imagePath: images[index],
                            height: 48,
                            width: 48,
                            fit: BoxFit.cover,
                            radius: 100,
                          ),
                          SizedBox(height: 10),
                          MyText(
                            text: titles[index],
                            size: 12,
                            lineHeight: 1.5,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: kRedColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'Live Match',
                          size: 12,
                          weight: FontWeight.w600,
                        ),
                      ),
                      MyText(text: 'View All', size: 12),
                    ],
                  ),
                  SizedBox(height: 10),
                  MatchScoreRow(),
                ],
              ),
            ),
            SizedBox(height: 30),
            _HeadingTile(title: 'Ballie For You', onTap: () {}),
            SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 230,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return BlurContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          paddingTop: 8,
                          text: index == 0 ? 'Group A' : 'Group B',
                          weight: FontWeight.w500,
                          paddingBottom: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(Assets.imagesVideoCamera, height: 18),
                            Expanded(
                              child: MyText(
                                paddingLeft: 5,
                                text: 'Live Matches',
                                size: 12,
                                color: kRedColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ...List.generate(4, (i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              spacing: 12,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CommonImageView(
                                        height: 20,
                                        width: 20,
                                        radius: 100,
                                        fit: BoxFit.cover,
                                        url: dummyImg,
                                      ),
                                      Expanded(
                                        child: MyText(
                                          paddingLeft: 4,
                                          text: 'RMD',
                                          size: 10,
                                          maxLines: 1,
                                          textOverflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                MyText(
                                  text: 'VS',
                                  size: 10,
                                  color: kQuaternaryColor,
                                  weight: FontWeight.w500,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: MyText(
                                          text: 'RMD',
                                          size: 10,
                                          paddingRight: 4,
                                          maxLines: 1,
                                          textOverflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      CommonImageView(
                                        height: 20,
                                        width: 20,
                                        radius: 100,
                                        fit: BoxFit.cover,
                                        url: dummyImg,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _HeadingTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const _HeadingTile({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyText(text: title, size: 16, weight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: onTap,
          child: Image.asset(Assets.imagesArrowNextRoundedSm, height: 24),
        ),
      ],
    );
  }
}
