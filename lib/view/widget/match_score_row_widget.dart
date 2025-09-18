import 'dart:ui';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/view/screens/watcher/w_home/w_club_review.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MatchScoreRow extends StatelessWidget {
  const MatchScoreRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 40,
      children: [
        Expanded(
          child: Row(
            children: [
              CommonImageView(
                height: 48,
                width: 48,
                radius: 100,
                fit: BoxFit.cover,
                imagePath: Assets.imagesFc,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(text: 'RMD', size: 12, textAlign: TextAlign.center),
                    MyText(
                      text: '2',
                      size: 26,
                      textAlign: TextAlign.center,
                      fontFamily: AppFonts.ANTA,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            MyText(text: '1st', size: 12, textAlign: TextAlign.center),
            MyText(
              text: '19:45',
              size: 16,
              weight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(text: 'RMD', size: 12, textAlign: TextAlign.center),
                    MyText(
                      text: '2',
                      size: 26,
                      textAlign: TextAlign.center,
                      fontFamily: AppFonts.ANTA,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => WClubReview());
                },
                child: CommonImageView(
                  height: 48,
                  width: 48,
                  radius: 100,
                  fit: BoxFit.cover,
                  imagePath: Assets.imagesChelsea,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
