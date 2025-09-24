import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/watcher/w_live_football_locations/w_filter_by_match.dart';
import 'package:ballie/view/screens/watcher/w_live_football_locations/w_match_screening.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WVenuesInYourArea extends StatelessWidget {
  const WVenuesInYourArea({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 39),
            Expanded(
              child: Padding(
                padding: AppSizes.DEFAULT,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: TextFormField(
                        style: TextStyle(
                          color: kTertiaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.imagesSearchRounded,
                                height: 38,
                              ),
                            ],
                          ),
                          suffixIcon: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.imagesArrowNextRoundedLg,
                                height: 38,
                              ),
                            ],
                          ),
                          filled: true,
                          fillColor: kTertiaryColor.withValues(alpha: 0.1),
                          hintText: "Search location",
                          hintStyle: TextStyle(
                            color: kTertiaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        children: [
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Venues',
                                  size: 16,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => WFilterByMatch());
                                },
                                child: Container(
                                  height: 35,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: kSecondaryColor,
                                    ),
                                    color: kSecondaryColor.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    spacing: 6,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.imagesFilter,
                                        height: 18,
                                      ),
                                      MyText(
                                        text: 'Filter by matches',
                                        size: 12,
                                        weight: FontWeight.w500,
                                        color: kSecondaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10),
                            shrinkWrap: true,
                            padding: AppSizes.VERTICAL,
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => WMatchScreening());
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: kTertiaryColor.withValues(alpha: .2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      CommonImageView(
                                        height: 38,
                                        width: 38,
                                        radius: 10,
                                        url: dummyImg,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: MyText(
                                          text: 'Danish Bard',
                                          size: 14,
                                          weight: FontWeight.w600,
                                        ),
                                      ),
                                      MyText(
                                        text: '2.5 km',
                                        size: 12,
                                        color: kSecondaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
    );
  }
}
