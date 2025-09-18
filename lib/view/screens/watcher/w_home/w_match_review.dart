import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/watcher/w_live_matches/w_account_details.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/match_score_row_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class WMatchReview extends StatelessWidget {
  const WMatchReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesMatchReviewBg,
            height: Get.height,
            width: Get.width,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: AppSizes.DEFAULT,
                child: BlurContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: CommonImageView(
                            imagePath: Assets.imagesCl,
                            height: 48,
                            width: 48,
                            fit: BoxFit.cover,
                            radius: 100,
                          ),
                        ),
                        SizedBox(height: 10),
                        MyText(
                          text: 'UEFA Champions League',
                          size: 14,
                          weight: FontWeight.w600,
                          lineHeight: 1.5,
                          paddingBottom: 30,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: AppSizes.HORIZONTAL,
                          child: MatchScoreRow(),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              color: kRedColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.imagesVideoCamera,
                                  height: 18,
                                  color: kTertiaryColor,
                                ),
                                MyText(
                                  text: 'Live on',
                                  size: 10,
                                  paddingLeft: 5,
                                  paddingRight: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 100,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 10);
                            },
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            padding: AppSizes.HORIZONTAL,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              final List<String> dummyImages = [
                                Assets.imagesBbc,
                                Assets.imagesBts,
                                Assets.imagesSs,
                                Assets.imagesTs,
                              ];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => WAccountDetails());
                                },
                                child: CommonImageView(
                                  height: 100,
                                  width: 100,
                                  radius: 10,
                                  fit: BoxFit.cover,
                                  imagePath: dummyImages[index],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30),

                        Padding(
                          padding: AppSizes.HORIZONTAL,
                          child: MyButton(
                            buttonText: '',
                            onTap: () {},
                            customChild: Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.imagesMap,
                                  height: 18,
                                  color: kPrimaryColor,
                                ),
                                MyText(
                                  text: 'Show Venue Locations',
                                  size: 15,
                                  color: kPrimaryColor,
                                  fontFamily: AppFonts.ANTA,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(children: [simpleAppBar(title: 'Match Review')]),
        ],
      ),
    );
  }
}
