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
                child: Image.asset(Assets.imagesScanItem, height: 32),
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
            Row(
              children: [
                Container(
                  height: 26,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Assets.imagesPoint, height: 16, width: 16),
                      MyText(
                        text: '300',
                        size: 10,
                        weight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            MyText(text: 'Ballie for You', size: 22, weight: FontWeight.w600),
            SizedBox(height: 30),
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
            _HeadingTile(title: 'Live matches in your region', onTap: () {}),
            SizedBox(height: 12),
            BlurContainer(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CommonImageView(
                          height: 28,
                          width: 28,
                          radius: 100,
                          fit: BoxFit.cover,
                          url: dummyImg,
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 10,
                      paddingBottom: 10,
                      text: 'UEFA Champions League',
                      size: 14,
                      weight: FontWeight.w500,
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
                    ...List.generate(2, (i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CommonImageView(
                                    height: 16,
                                    width: 16,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                  Expanded(
                                    child: MyText(
                                      text: 'RMD',
                                      size: 10,
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  MyText(
                                    text: '2',
                                    size: 12,
                                    maxLines: 1,
                                    weight: FontWeight.w600,
                                    textOverflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            MyText(
                              paddingLeft: 5,
                              paddingRight: 5,
                              text: 'VS',
                              size: 10,
                              color: kQuaternaryColor,
                              weight: FontWeight.w500,
                            ),
                            MyText(
                              text: '1',
                              size: 12,
                              maxLines: 1,
                              weight: FontWeight.w600,
                              textOverflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
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
                                    height: 16,
                                    width: 16,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                ],
                              ),
                            ),
                            MyText(
                              paddingLeft: 5,
                              paddingRight: 10,
                              text: '32:15',
                              size: 10,
                              color: kQuaternaryColor,
                              weight: FontWeight.w500,
                            ),
                            Container(
                              width: 90,
                              height: 25,
                              decoration: BoxDecoration(
                                color: kRedColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.imagesVideoCamera,
                                    height: 13,
                                    color: kTertiaryColor,
                                  ),
                                  MyText(
                                    paddingLeft: 3,
                                    paddingRight: 3,
                                    text: 'Live Matches',
                                    size: 9,
                                    color: kTertiaryColor,
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
            ),

            SizedBox(height: 12),
            BlurContainer(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CommonImageView(
                          height: 28,
                          width: 28,
                          radius: 100,
                          fit: BoxFit.cover,
                          url: dummyImg,
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 10,
                      paddingBottom: 10,
                      text: 'UEFA Champions League',
                      size: 14,
                      weight: FontWeight.w500,
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
                    ...List.generate(2, (i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CommonImageView(
                                    height: 16,
                                    width: 16,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                  Expanded(
                                    child: MyText(
                                      text: 'RMD',
                                      size: 10,
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  MyText(
                                    text: '2',
                                    size: 12,
                                    maxLines: 1,
                                    weight: FontWeight.w600,
                                    textOverflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            MyText(
                              paddingLeft: 5,
                              paddingRight: 5,
                              text: 'VS',
                              size: 10,
                              color: kQuaternaryColor,
                              weight: FontWeight.w500,
                            ),
                            MyText(
                              text: '1',
                              size: 12,
                              maxLines: 1,
                              weight: FontWeight.w600,
                              textOverflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
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
                                    height: 16,
                                    width: 16,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                ],
                              ),
                            ),
                            MyText(
                              paddingLeft: 5,
                              paddingRight: 10,
                              text: '32:15',
                              size: 10,
                              color: kQuaternaryColor,
                              weight: FontWeight.w500,
                            ),
                            Container(
                              width: 90,
                              height: 25,
                              decoration: BoxDecoration(
                                color: kRedColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.imagesVideoCamera,
                                    height: 13,
                                    color: kTertiaryColor,
                                  ),
                                  MyText(
                                    paddingLeft: 3,
                                    paddingRight: 3,
                                    text: 'Live Matches',
                                    size: 9,
                                    color: kTertiaryColor,
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
            ),

            SizedBox(height: 20),
            _HeadingTile(title: 'Nearby Venues', onTap: () {}),
            SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 160,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: BlurContainer(
                    radius: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                CommonImageView(
                                  imagePath: Assets.imagesDummyMap,
                                  width: Get.width,
                                  fit: BoxFit.cover,
                                  radius: 6,
                                ),
                                Center(
                                  child: Image.asset(
                                    Assets.imagesMarker,
                                    height: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MyText(
                            paddingTop: 10,
                            text: 'Danish Bar',
                            size: 14,
                            color: kTertiaryColor,
                          ),
                        ],
                      ),
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
