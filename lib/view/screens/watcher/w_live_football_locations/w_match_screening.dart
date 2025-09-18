import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/match_score_row_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

class WMatchScreening extends StatelessWidget {
  const WMatchScreening({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Match Screening'),
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
                        MyText(
                          text: 'Match Screening',
                          size: 12,
                          weight: FontWeight.w600,
                          paddingBottom: 12,
                        ),
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

                  MyText(
                    paddingTop: 20,
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Risus suspendisse vitae aliquam auctor maecenas aliquet. Elementum lacinia morbi elementum vel ornare donec ultricies. Enim lectus elit cursus tincidunt hac mi mi sed.',
                    size: 13,
                    lineHeight: 1.5,
                    paddingBottom: 20,
                  ),
                  BlurContainer(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: 'Review Venue',
                            size: 12,
                            weight: FontWeight.w600,
                            paddingBottom: 10,
                          ),
                          ...List.generate(3, (index) {
                            final fields = [
                              {'label': 'Hosting', 'value': ''},
                              {'label': 'Service', 'value': ''},
                              {'label': 'Complimentary', 'value': ''},
                            ];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.5,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: MyText(
                                      text: fields[index]['label']!,
                                      size: 12,
                                    ),
                                  ),
                                  RatingBarIndicator(
                                    rating: 5,
                                    itemBuilder: (context, _) =>
                                        Image.asset(Assets.imagesStar),
                                    itemCount: 5,
                                    itemSize: 24,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                            );
                          }),
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
          child: MyButton(buttonText: 'Get Directions', onTap: () {}),
        ),
      ),
    );
  }
}
