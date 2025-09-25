import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/auth/forgot_pass/otp_verification.dart';
import 'package:ballie/view/screens/auth/login.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_field_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

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
            SizedBox(height: 30),
            Spacer(flex: 3),
            Expanded(
              flex: 6,
              child: BlurContainer(child: _CreateNewPassword()),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateNewPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      physics: BouncingScrollPhysics(),
      children: [
        Image.asset(Assets.imagesLogo, height: 70),
        MyText(
          paddingTop: 30,
          text: 'Create new password',
          size: 16,
          weight: FontWeight.w500,
          paddingBottom: 10,
        ),
        MyText(
          text:
              'Set a strong password for your account. Enter your new password below.',
          size: 12,
          color: kBorderColor,
          paddingBottom: 30,
        ),
        MyTextField(
          labelText: 'Password',
          hintText: '********',
          prefix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesLock, height: 18)],
          ),
        ),
        MyTextField(
          marginBottom: 30,
          labelText: 'Confirm Password',
          hintText: '********',
          prefix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesLock, height: 18)],
          ),
        ),
        MyButton(
          buttonText: 'Save Changes',
          onTap: () {
            Get.offAll(() => Login());
          },
        ),
      ],
    );
  }
}
