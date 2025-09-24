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

class WNewsDetails extends StatelessWidget {
  const WNewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'News'),
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
                  MyText(
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Proin nunc vitae quis eget.',
                    size: 14,
                    weight: FontWeight.w500,
                    paddingBottom: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kTertiaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        child: Row(
                          spacing: 6,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonImageView(
                              height: 24,
                              width: 24,
                              radius: 100,
                              fit: BoxFit.cover,
                              url: dummyImg,
                            ),
                            MyText(
                              paddingRight: 2,
                              text: 'Alex Benjamin',
                              size: 12,
                              color: kQuaternaryColor,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  MyText(
                    paddingTop: 10,
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Risus suspendisse vitae aliquam auctor maecenas aliquet. Elementum lacinia morbi elementum vel ornare donec ultricies. Enim lectus elit cursus tincidunt hac mi mi sed.',
                    size: 13,
                    color: kQuaternaryColor,
                    lineHeight: 1.5,
                    paddingBottom: 14,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: MyText(
                      text:
                          '“Lorem ipsum dolor sit amet consectetur. Placerat nibh enim pharetra tempor at facilisi non.”',
                      size: 12,
                      color: kSecondaryColor,
                    ),
                  ),
                  MyText(
                    paddingTop: 14,
                    text:
                        'Lorem ipsum dolor sit amet consectetur. Aliquet posuere neque id facilisis vitae scelerisque vitae. Diam vitae proin a sed. Faucibus sit malesuada leo id at habitant nisl commodo neque. Leo sit suspendisse in nullam vitae est mattis. Gravida leo praesent leo et. Risus magna molestie neque dignissim sit euismod diam. Proin id quis molestie enim adipiscing in sem aliquam. Nibh et etiam suscipit ac ac. Amet scelerisque nunc aliquet proin eget ut faucibus rhoncus. Auctor tempus fermentum pulvinar in ultricies cursus iaculis. Volutpat elementum varius leo ultrices. Velit sed ultrices integer faucibus. Pellentesque gravida orci porttitor ipsum. Vulputate vitae amet pharetra libero quisque sit lacus sed eget. Scelerisque duis sit interdum ante viverra. Elit id a eleifend et ultrices malesuada amet ultrices at. Leo diam volutpat mattis in habitant ac suspendisse. Lacinia volutpat faucibus ante lorem. Ut et etiam feugiat nunc tortor vitae aenean tincidunt. Ultrices at dictum augue dui egestas enim sem morbi. Morbi at scelerisque ipsum duis amet aliquet nibh feugiat. Ullamcorper dolor eu orci.',
                    size: 13,
                    color: kQuaternaryColor,
                    lineHeight: 1.5,
                  ),
                  MyText(
                    paddingTop: 20,
                    text: 'More like this',
                    size: 16,
                    weight: FontWeight.w600,
                    paddingBottom: 12,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 180,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: BlurContainer(
                          radius: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CommonImageView(
                                    url: dummyImg,
                                    width: Get.width,
                                    fit: BoxFit.cover,
                                    radius: 6,
                                  ),
                                ),
                                MyText(
                                  paddingTop: 10,
                                  text:
                                      'Lorem ipsum dolor sit amet consectetur.',
                                  size: 12,
                                  color: kQuaternaryColor,
                                ),
                              ],
                            ),
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
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(buttonText: 'Get Directions', onTap: () {}),
        ),
      ),
    );
  }
}
