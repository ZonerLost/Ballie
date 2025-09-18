import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/owner/o_notifications/o_notifications.dart';
import 'package:ballie/view/screens/owner/o_qr_generator/o_generate_qr.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/match_score_row_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OQrGenerator extends StatelessWidget {
  const OQrGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          title: MyText(text: 'QR Generator'),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ONotifications());
                },
                child: Image.asset(Assets.imagesNotification, height: 32),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Running QRs',
                      size: 12,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 4),
                    ...List.generate(
                      2,
                      (index) => Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Image.asset(Assets.imagesQr, height: 48),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: 'Danish Bar',
                                    size: 12,
                                    weight: FontWeight.w600,
                                    paddingBottom: 2,
                                  ),
                                  MyText(text: '50% off on drinks', size: 14),
                                ],
                              ),
                            ),
                            Image.asset(Assets.imagesMore, height: 24),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(() => OGenerateQr());
              },
              child: BlurContainer(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'Generate QR',
                        size: 12,
                        weight: FontWeight.w600,
                      ),
                      SizedBox(height: 20),
                      Image.asset(Assets.imagesScanQr, height: 60),
                      MyText(
                        text: 'Tap to add details',
                        size: 12,
                        color: kQuaternaryColor,
                        paddingTop: 20,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
