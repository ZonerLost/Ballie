import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/auth/forgot_pass/create_new_pass.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:pinput/pinput.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

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
            Expanded(flex: 5, child: BlurContainer(child: _OTPVerification())),
          ],
        ),
      ),
    );
  }
}

class _OTPVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PinTheme pinTheme = PinTheme(
      width: 70,
      height: 50,
      margin: EdgeInsets.zero,
      textStyle: TextStyle(
        fontSize: 20,
        height: 0.0,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.POPPINS,
        color: kTertiaryColor,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor, width: 1.0),
        borderRadius: BorderRadius.circular(50),
        color: kFillColor,
      ),
    );
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      physics: BouncingScrollPhysics(),
      children: [
        Image.asset(Assets.imagesLogo, height: 70),
        MyText(
          paddingTop: 30,
          text: 'Password recovery',
          size: 16,
          weight: FontWeight.w500,
          paddingBottom: 10,
        ),
        MyText(
          text:
              'Enter the 4-digit code sent over your email to access your account',
          size: 12,
          color: kBorderColor,
          paddingBottom: 20,
        ),
        MyText(
          text: 'Enter Code',
          paddingBottom: 6,
          size: 12,
          color: kBorderColor,
          weight: FontWeight.w600,
        ),
        Pinput(
          keyboardType: TextInputType.number,
          length: 4,
          pinContentAlignment: Alignment.center,
          defaultPinTheme: pinTheme,
          focusedPinTheme: pinTheme,
          submittedPinTheme: pinTheme,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          onCompleted: (value) {},
        ),
        SizedBox(height: 30),
        MyButton(
          buttonText: 'Verify Code',
          onTap: () {
            Get.to(() => CreateNewPassword());
          },
        ),
      ],
    );
  }
}
