import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/owner/o_home/o_all_leagues.dart';
import 'package:ballie/view/screens/owner/o_home/o_league_matches.dart';
import 'package:ballie/view/screens/owner/o_notifications/o_notifications.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OHome extends StatelessWidget {
  const OHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leadingWidth: 80,
          titleSpacing: 0,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImageView(
                height: 40,
                width: 40,
                radius: 100,
                fit: BoxFit.cover,
                url: dummyImg,
              ),
            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(
                text: 'Welcome Back!',
                size: 12,
                paddingBottom: 2,
                color: kQuaternaryColor,
              ),
              MyText(text: 'Jhon Doe', size: 14, weight: FontWeight.w600),
            ],
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ONotifications());
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
            BlurContainer(
              radius: 10,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Today’s Screening',
                      size: 12,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 10),
                    Row(
                      spacing: 40,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CommonImageView(
                                height: 48,
                                width: 48,
                                radius: 100,
                                fit: BoxFit.cover,
                                imagePath: Assets.imagesFc,
                              ),
                              Expanded(
                                child: MyText(
                                  text: 'RMD',
                                  size: 12,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MyText(
                          text: '19:45',
                          size: 16,
                          weight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'RMD',
                                  size: 12,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: CommonImageView(
                                  height: 48,
                                  width: 48,
                                  radius: 100,
                                  fit: BoxFit.cover,
                                  imagePath: Assets.imagesChelsea,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            _HeadingTile(
              title: 'Leagues',
              onTap: () {
                Get.to(() => OAllLeagues());
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
                    Get.to(() => OLeagueMatches());
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
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: kPurpleColor,
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
                          text: 'Upcoming matches',
                          size: 12,
                          weight: FontWeight.w600,
                        ),
                      ),
                      MyText(text: 'View All', size: 12),
                    ],
                  ),
                  SizedBox(height: 10),
                  ...List.generate(3, (i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        spacing: 50,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CommonImageView(
                                  height: 24,
                                  width: 24,
                                  radius: 100,
                                  fit: BoxFit.cover,
                                  url: dummyImg,
                                ),
                                Expanded(
                                  child: MyText(
                                    text: 'RMD',
                                    size: 12,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MyText(text: 'VS', size: 16, weight: FontWeight.w700),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: 'RMD',
                                    size: 12,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                CommonImageView(
                                  height: 24,
                                  width: 24,
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
            MyText(
              text: 'Venues',
              size: 16,
              weight: FontWeight.w500,
              paddingTop: 20,
              paddingBottom: 12,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 140,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CommonImageView(
                              url: dummyImg,
                              width: Get.width,
                              fit: BoxFit.cover,
                              radius: 6,
                            ),
                          ),
                          MyText(
                            paddingTop: 10,
                            text: 'Danish Bar',
                            size: 10,
                            color: kQuaternaryColor,
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
