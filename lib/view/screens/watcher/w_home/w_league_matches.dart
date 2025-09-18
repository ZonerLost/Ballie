import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/watcher/w_home/w_match_review.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WLeagueMatches extends StatelessWidget {
  const WLeagueMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'League Matches'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
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
                  onTap: () {
                    Get.to(() => WMatchReview());
                  },
                  child: BlurContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Image.asset(Assets.imagesVideoCamera, height: 18),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                children: [
                                  CommonImageView(
                                    height: 24,
                                    width: 24,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                  MyText(
                                    paddingTop: 20,
                                    text: '2',
                                    size: 22,
                                    fontFamily: AppFonts.ANTA,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    MyText(
                                      text: '12:45',
                                      size: 10,
                                      color: kRedColor,
                                    ),
                                    MyText(
                                      text: 'VS',
                                      size: 14,
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  CommonImageView(
                                    height: 24,
                                    width: 24,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                  MyText(
                                    paddingTop: 20,
                                    text: '1',
                                    size: 22,
                                    fontFamily: AppFonts.ANTA,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
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
            SizedBox(height: 20),
            _ScoreBoard(),
          ],
        ),
      ),
    );
  }
}

class _ScoreBoard extends StatefulWidget {
  @override
  State<_ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<_ScoreBoard> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      child: Container(
        height: 300,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MyText(
                    text: 'Group A',
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: kTertiaryColor,
                    dotColor: kQuaternaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, pageIndex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 70),
                          ...['M', 'W', 'D', 'L', 'G', 'PTS'].map(
                            (label) => MyText(
                              text: label,
                              size: 12,
                              color: kQuaternaryColor,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ...List.generate(6, (i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 70,
                                child: Row(
                                  children: [
                                    CommonImageView(
                                      height: 24,
                                      width: 24,
                                      radius: 100,
                                      url: dummyImg,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: MyText(
                                        text: 'RMD',
                                        size: 10,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ...['3', '2', '0', '0', '5', '23'].map(
                                (text) => MyText(
                                  text: text,
                                  size: 10,
                                  paddingRight: 5,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
