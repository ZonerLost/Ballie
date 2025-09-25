import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class WFilterByMatch extends StatelessWidget {
  const WFilterByMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(title: ''),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: AppSizes.DEFAULT,
              child: ClipRRect(
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
                        Image.asset(Assets.imagesSearchRounded, height: 38),
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
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: AppSizes.HORIZONTAL,
                physics: BouncingScrollPhysics(),
                children: [
                  MyText(
                    text: 'Filter by matches',
                    size: 16,
                    weight: FontWeight.w500,
                    paddingBottom: 12,
                  ),
                  ...List.generate(3, (index) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: index == 1
                                  ? Color(0xffFF383C)
                                  : index == 2
                                  ? Color(0xffFF8D28)
                                  : kPurpleColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Row(
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
                                          weight: FontWeight.w500,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                MyText(
                                  text: 'VS',
                                  size: 14,
                                  weight: FontWeight.w700,
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: MyText(
                                          text: 'RMD',
                                          size: 12,
                                          weight: FontWeight.w500,
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
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
