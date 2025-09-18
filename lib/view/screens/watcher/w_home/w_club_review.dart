import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WClubReview extends StatelessWidget {
  const WClubReview({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Chelsea'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.ZERO,
          physics: BouncingScrollPhysics(),
          children: [
            CommonImageView(
              height: 170,
              width: Get.width,
              radius: 0,
              fit: BoxFit.cover,
              url: dummyImg,
            ),
            Padding(
              padding: AppSizes.DEFAULT,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          CommonImageView(
                            height: 48,
                            width: 48,
                            radius: 100,
                            fit: BoxFit.cover,
                            url: dummyImg,
                          ),
                          MyText(
                            paddingTop: 4,
                            text: 'Chelsea',
                            size: 14,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          spacing: 10,
                          children: [
                            SizedBox(width: 40),
                            Expanded(
                              child: MyButton(
                                height: 40,
                                buttonText: 'Follow',
                                onTap: () {},
                              ),
                            ),
                            Image.asset(Assets.imagesNotification, height: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                  MyText(
                    paddingTop: 10,
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Risus suspendisse vitae aliquam auctor maecenas aliquet. Elementum lacinia morbi elementum vel ornare donec ultricies. Enim lectus elit cursus tincidunt hac mi mi sed.',
                    size: 13,
                    lineHeight: 1.5,
                    paddingBottom: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kPurpleColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Upcoming match',
                          size: 12,
                          weight: FontWeight.w600,
                          paddingBottom: 12,
                        ),
                        Row(
                          spacing: 40,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CommonImageView(
                                    height: 32,
                                    width: 32,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                  Expanded(
                                    child: MyText(
                                      text: 'RMD',
                                      size: 14,
                                      weight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MyText(
                              text: 'VS',
                              size: 16,
                              weight: FontWeight.w700,
                              textAlign: TextAlign.center,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: MyText(
                                      text: 'RMD',
                                      size: 14,
                                      weight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  CommonImageView(
                                    height: 32,
                                    width: 32,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'Players',
                          size: 16,
                          weight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          Assets.imagesArrowNextRoundedLg,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 150,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final List<Map<String, String>> players = [
                        {
                          'name': 'Robert Sanchez',
                          'position': 'Goalkeeper',
                          'image': dummyImg,
                        },
                        {
                          'name': 'Mykhailo Mudryk',
                          'position': 'Midfielder',
                          'image': dummyImg,
                        },
                        {
                          'name': 'Raheem Sterling',
                          'position': 'Goalkeeper',
                          'image': dummyImg,
                        },
                      ];
                      return GestureDetector(
                        onTap: () {},
                        child: BlurContainer(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonImageView(
                                  url: dummyImg,
                                  height: 48,
                                  width: 48,
                                  fit: BoxFit.cover,
                                  radius: 100,
                                ),
                                SizedBox(height: 10),
                                MyText(
                                  text: players[index]['name']!,
                                  size: 12,
                                  lineHeight: 1.5,
                                  textAlign: TextAlign.center,
                                ),
                                MyText(
                                  paddingTop: 2,
                                  text: players[index]['position']!,
                                  size: 10,
                                  color: kQuaternaryColor,
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
                  _ScoreBoard(),
                  SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 210,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: BlurContainer(
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
                                    radius: 10,
                                  ),
                                ),
                                MyText(
                                  paddingTop: 10,
                                  text:
                                      'Lorem ipsum dolor sit amet consectetur.',
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
