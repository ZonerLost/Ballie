import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/owner/o_venue/o_edit_venue_details.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class OVenueDetail extends StatelessWidget {
  const OVenueDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Venue Screenings'),
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
                            MyText(
                              text: '16:00',
                              size: 12,
                              weight: FontWeight.w600,
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
                  BlurContainer(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Upcoming matches',
                                  size: 12,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              MyText(text: 'View All', size: 12),
                            ],
                          ),
                          SizedBox(height: 10),
                          ...List.generate(3, (i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                spacing: 50,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        CommonImageView(
                                          height: 24,
                                          width: 24,
                                          radius: 100,
                                          fit: BoxFit.cover,
                                          url: dummyImg,
                                        ),
                                        Expanded(
                                          child: MyText(
                                            text: 'RMD',
                                            size: 12,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.ellipsis,
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
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: MyText(
                                            text: 'RMD',
                                            size: 12,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        CommonImageView(
                                          height: 24,
                                          width: 24,
                                          radius: 100,
                                          fit: BoxFit.cover,
                                          url: dummyImg,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  BlurContainer(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'Available Deals',
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                          ...List.generate(
                            2,
                            (index) => Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kTertiaryColor.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Image.asset(Assets.imagesQr, height: 48),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        MyText(
                                          text: 'Danish Bar',
                                          size: 12,
                                          weight: FontWeight.w600,
                                          paddingBottom: 2,
                                        ),
                                        MyText(
                                          text: '50% off on drinks',
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Edit Details',
            onTap: () {
              Get.to(() => OEditVenueDetails());
            },
          ),
        ),
      ),
    );
  }
}
