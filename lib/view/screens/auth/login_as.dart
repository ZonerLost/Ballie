import 'dart:ui';

import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/controller/user_controller.dart';
import 'package:ballie/utils/getx_controller_instances.dart';
import 'package:ballie/view/screens/auth/login.dart';
import 'package:ballie/view/screens/launch/onboarding.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginAs extends StatelessWidget {
  const LoginAs({super.key});

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
          children: [BlurContainer(child: _loginAs())],
        ),
      ),
    );
  }

  Widget _loginAs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(Assets.imagesLogoRounded, height: 56),
          MyText(
            paddingTop: 30,
            text: 'Login As',
            size: 16,
            weight: FontWeight.w500,
            paddingBottom: 10,
          ),
          MyText(
            text: 'Select the role you want to login as',
            size: 12,
            color: kBorderColor,
            paddingBottom: 30,
          ),
          MyButton(
            buttonText: '',
            onTap: () {
              userController.chooseRole(UserRole.watcher);
              Get.to(() => Login());
            },
            customChild: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesWatcher, height: 18),
                MyText(
                  text: 'Watcher',
                  size: 15,
                  color: kPrimaryColor,
                  fontFamily: AppFonts.ANTA,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          MyButton(
            buttonText: '',
            onTap: () {
              userController.chooseRole(UserRole.owner);
              Get.to(() => Login());
            },
            customChild: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesLocationPin, height: 18),
                MyText(
                  text: 'Venue Owner',
                  size: 15,
                  color: kPrimaryColor,
                  fontFamily: AppFonts.ANTA,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
