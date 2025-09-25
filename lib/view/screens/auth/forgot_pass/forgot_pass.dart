import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/auth/forgot_pass/otp_verification.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_field_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
            SizedBox(height: 50),
            Spacer(flex: 4),
            Expanded(flex: 5, child: BlurContainer(child: _ForgotPassword())),
          ],
        ),
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
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
          text: 'Verify your account',
          size: 16,
          weight: FontWeight.w500,
          paddingBottom: 10,
        ),
        MyText(
          text:
              'Enter your email to send the 4 digit code to verify your account',
          size: 12,
          color: kBorderColor,
          paddingBottom: 30,
        ),
        MyTextField(
          marginBottom: 30,
          labelText: 'Enter Email',
          hintText: 'example@email.com',
          prefix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesEmail, height: 18)],
          ),
        ),
        MyButton(
          buttonText: 'Send Code',
          onTap: () {
            Get.to(() => OTPVerification());
          },
        ),
      ],
    );
  }
}
