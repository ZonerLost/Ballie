import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/controller/user_controller.dart';
import 'package:ballie/utils/getx_controller_instances.dart';
import 'package:ballie/view/screens/auth/forgot_pass/forgot_pass.dart';
import 'package:ballie/view/screens/auth/sign_up/sign_up.dart';
import 'package:ballie/view/screens/bottom_nav_bar/owner_nav_bar.dart';
import 'package:ballie/view/screens/bottom_nav_bar/watcher_nav_bar.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_field_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class Login extends StatelessWidget {
  const Login({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 3),
            Expanded(flex: 9, child: BlurContainer(child: _Login())),
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      physics: BouncingScrollPhysics(),
      children: [
        Image.asset(Assets.imagesLogo, height: 70),
        SizedBox(height: 30),
        MyTextField(
          labelText: 'Email',
          hintText: 'example@email.com',
          prefix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesEmail, height: 18)],
          ),
        ),
        MyTextField(
          marginBottom: 8,
          labelText: 'Password',
          hintText: '********',
          prefix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesLock, height: 18)],
          ),
        ),
        MyText(
          onTap: () {
            Get.to(() => ForgotPassword());
          },
          size: 12,
          textAlign: TextAlign.end,
          text: 'Forgot Password?',
          weight: FontWeight.w500,
          color: kSecondaryColor,
        ),
        SizedBox(height: 30),
        MyButton(
          buttonText: 'Login',
          onTap: () {
            userController.role == UserRole.watcher
                ? Get.to(() => WatcherNavBar())
                : Get.to(() => OwnerNavBar());
          },
        ),
        SizedBox(height: 30),
        Image.asset(Assets.imagesOr),
        SizedBox(height: 20),
        Row(
          spacing: 10,
          children: List.generate(3, (index) {
            return Expanded(
              child: Image.asset(
                [
                  Assets.imagesGoogle,
                  Assets.imagesFacebook,
                  Assets.imagesApple,
                ][index],
                height: 48,
              ),
            );
          }),
        ),

        SizedBox(height: 30),
        Center(
          child: Wrap(
            children: [
              MyText(text: 'Don’t have an account? ', size: 12),
              MyText(
                onTap: () {
                  Get.to(() => SignUp());
                },
                text: 'Create Account',
                weight: FontWeight.w500,
                color: kSecondaryColor,
                size: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
