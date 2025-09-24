import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/launch/get_started.dart';
import 'package:ballie/view/screens/launch/onboarding.dart';
import 'package:ballie/view/widget/custom_check_box_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectClub extends StatefulWidget {
  const SelectClub({super.key});

  @override
  State<SelectClub> createState() => _SelectClubState();
}

class _SelectClubState extends State<SelectClub> {
  int selectedIndex = 0;

  final List<Map<String, String>> clubs = [
    {'image': Assets.imagesCh, 'title': 'Chelsea'},
    {'image': Assets.imagesRm, 'title': 'Real Madrid'},
    {'image': Assets.imagesFcBar, 'title': 'FC Barcelona'},
    {'image': Assets.imagesMu, 'title': 'Manchester United'},
    {'image': Assets.imagesLp, 'title': 'Liverpool'},
    {'image': Assets.imagesMc, 'title': 'Manchester City'},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(Assets.imagesLogo, height: 95),
            MyText(
              paddingTop: 30,
              text: 'Select the club you follow',
              size: 18,
              textAlign: TextAlign.center,
              lineHeight: 1.5,
              paddingBottom: 16,
            ),
            Container(
              margin: AppSizes.DEFAULT,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: kTertiaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kTertiaryColor),
              ),
              child: ListView.separated(
                itemCount: clubs.length,
                padding: AppSizes.ZERO,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        Image.asset(
                          clubs[index]['image']!,
                          height: 32,
                          width: 32,
                        ),
                        Expanded(
                          child: MyText(
                            paddingLeft: 12,
                            text: clubs[index]['title']!,
                            weight: FontWeight.w500,
                          ),
                        ),
                        CustomCheckBox(
                          isActive: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          isRadio: true,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    color: kTertiaryColor,
                    margin: EdgeInsets.symmetric(vertical: 12),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: '',
            onTap: () {
              Get.to(() => GetStarted());
            },
            customChild: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: 'Next',
                  size: 15,
                  color: kPrimaryColor,
                  fontFamily: AppFonts.ANTA,
                ),
                Image.asset(Assets.imagesArrowNext, height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
