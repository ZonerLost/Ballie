import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class OMatchScreening extends StatelessWidget {
  const OMatchScreening({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'CHL v RMD'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.ZERO,
          physics: BouncingScrollPhysics(),
          children: [
            CommonImageView(
              height: 170,
              width: Get.width,
              radius: 0,
              fit: BoxFit.cover,
              url: dummyImg,
            ),
            Padding(
              padding: AppSizes.DEFAULT,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kPurpleColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                text: 'Match Screening',
                                size: 12,
                                weight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          spacing: 40,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CommonImageView(
                                    height: 32,
                                    width: 32,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                  Expanded(
                                    child: MyText(
                                      text: 'RMD',
                                      size: 14,
                                      weight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MyText(
                              text: 'VS',
                              size: 16,
                              weight: FontWeight.w700,
                              textAlign: TextAlign.center,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: MyText(
                                      text: 'RMD',
                                      size: 14,
                                      weight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  CommonImageView(
                                    height: 32,
                                    width: 32,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                    url: dummyImg,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  _VenueScreening(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VenueScreening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      radius: 14,
      child: Container(
        height: 210,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  CommonImageView(
                    imagePath: Assets.imagesDummyMap,
                    width: Get.width,
                    fit: BoxFit.cover,
                    radius: 10,
                  ),
                  Center(
                    child: Image.asset(
                      Assets.imagesVenueScreeningMarker,
                      height: 56,
                    ),
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 10,
              textAlign: TextAlign.left,
              text: 'Danish Bar',
              size: 14,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
