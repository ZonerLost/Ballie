import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/auth/login.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_field_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
            Spacer(flex: 2),
            Expanded(flex: 10, child: BlurContainer(child: _SignUp())),
          ],
        ),
      ),
    );
  }
}

class _SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      physics: BouncingScrollPhysics(),
      children: [
        Image.asset(Assets.imagesLogoRounded, height: 56),
        SizedBox(height: 30),
        MyTextField(
          labelText: 'Full Name',
          hintText: 'Jhon Doe',
          prefix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesFullName, height: 18)],
          ),
        ),
        MyTextField(
          labelText: 'Email',
          hintText: 'example@email.com',
          prefix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesEmail, height: 18)],
          ),
        ),
        MyTextField(
          marginBottom: 30,
          labelText: 'Password',
          hintText: '********',
          prefix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesLock, height: 18)],
          ),
        ),

        MyButton(buttonText: 'Create Account', onTap: () {}),
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
              MyText(text: 'Already have an account? ', size: 12),
              MyText(
                onTap: () {
                  Get.offAll(() => Login());
                },
                text: 'Login',
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
