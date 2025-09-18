import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/auth/login_as.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<Map<String, String>> onboardingData = [
    {
      'image': Assets.imagesOn1,
      'title': 'Stay Connected',
      'subtitle': 'Keep a track of all the matches and the updates 24/7.',
    },
    {
      'image': Assets.imagesOn2,
      'title': 'Stream or Screen',
      'subtitle':
          'Stream the matches here or look for venues of match screening.',
    },
    {
      'image': Assets.imagesOn3,
      'title': 'Screen Matches',
      'subtitle':
          'You got a bar, club or any venue you can host a match? Register the match for enthusiasts like you.',
    },
    {
      'image': Assets.imagesOn4,
      'title': 'You Know Your Club',
      'subtitle':
          'Keep a track of your favorite club because we got all the updates for you.',
    },
  ];

  int currentPage = 0;
  final PageController _pageController = PageController();

  void _nextPage() {
    if (currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.to(() => LoginAs());
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60),
            Center(child: Image.asset(Assets.imagesLogo, height: 90)),
            SizedBox(height: 15),
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Padding(
                    padding: AppSizes.HORIZONTAL,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CommonImageView(
                            imagePath: data['image'] ?? '',
                            width: Get.width,
                            fit: BoxFit.cover,
                            radius: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: onboardingData.length,
                          effect: WormEffect(
                            dotHeight: 6,
                            dotWidth: 6,
                            activeDotColor: kSecondaryColor,
                            dotColor: kTertiaryColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: kTertiaryColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: data['title'] ?? '',
                                size: 22,
                                fontFamily: AppFonts.ANTA,
                                color: kSecondaryColor,
                                textAlign: TextAlign.center,
                                paddingBottom: 10,
                              ),
                              MyText(
                                text: data['subtitle'] ?? '',
                                size: 14,
                                lineHeight: 1.5,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: AppSizes.DEFAULT,
              child: MyButton(
                buttonText: '',
                onTap: _nextPage,
                customChild: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: currentPage == onboardingData.length - 1
                          ? 'Get Started'
                          : 'Next',
                      size: 15,
                      color: kPrimaryColor,
                      fontFamily: AppFonts.ANTA,
                    ),
                    Image.asset(Assets.imagesArrowNext, height: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
