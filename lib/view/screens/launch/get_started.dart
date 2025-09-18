import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/launch/onboarding.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: AppSizes.DEFAULT,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesGetStarted),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(Assets.imagesLogo, height: 130),
            MyText(
              paddingTop: 30,
              text:
                  'Lorem ipsum dolor sit amet consectetur. Magna fringilla nunc quis nunc auctor sed etiam eget dignissim. In nisl nullam et suspendisse. Sed sed cras ultricies nunc',
              size: 15,
              textAlign: TextAlign.center,
              lineHeight: 1.5,
              paddingBottom: 30,
            ),
            MyButton(
              buttonText: '',
              onTap: () {
                Get.to(() => Onboarding());
              },
              customChild: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: 'Get Started',
                    size: 15,
                    color: kPrimaryColor,
                    fontFamily: AppFonts.ANTA,
                  ),
                  Image.asset(Assets.imagesArrowNext, height: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
