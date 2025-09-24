import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/watcher/w_news/w_news_details.dart';
import 'package:ballie/view/screens/watcher/w_notifications/w_notifications.dart';
import 'package:ballie/view/screens/watcher/w_scan/w_scan.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WNews extends StatelessWidget {
  const WNews({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          title: MyText(text: 'Blogs & News'),
          actions: [
            // Center(
            //   child: GestureDetector(
            //     onTap: () {
            //       Get.to(() => WScan());
            //     },
            //     child: Image.asset(Assets.imagesScanItem, height: 32),
            //   ),
            // ),
            // SizedBox(width: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => WNotifications());
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
            // SizedBox(
            //   height: 30,
            //   child: ListView.separated(
            //     separatorBuilder: (context, index) => SizedBox(width: 10),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 3,
            //     padding: AppSizes.HORIZONTAL,
            //     physics: BouncingScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       final List<String> categories = ['Latest', 'New', 'Trending'];
            //       return Container(
            //         padding: EdgeInsets.symmetric(horizontal: 15),
            //         decoration: BoxDecoration(
            //           color: kTertiaryColor.withValues(alpha: 0.1),
            //           borderRadius: BorderRadius.circular(50),
            //         ),
            //         child: Center(
            //           child: MyText(
            //             text: categories[index],
            //             size: 12,
            //             color: kTertiaryColor,
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // SizedBox(height: 4),
            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 12);
              },
              itemCount: 4,
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return BlurContainer(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CommonImageView(
                          height: 176,
                          width: Get.width,
                          radius: 10,
                          fit: BoxFit.cover,
                          url: dummyImg,
                        ),
                        MyText(
                          paddingTop: 8,
                          text: 'Player OO7 missed the goal',
                          paddingBottom: 4,
                          size: 12,
                        ),
                        MyText(
                          size: 12,
                          text:
                              'Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.',
                          color: kQuaternaryColor,
                          paddingBottom: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MyText(
                                text: '2 hours ago',
                                size: 10,
                                color: kQuaternaryColor,
                              ),
                            ),
                            MyText(
                              onTap: () {
                                Get.to(() => WNewsDetails());
                              },
                              text: 'Read More',
                              size: 12,
                              paddingRight: 6,
                              color: kSecondaryColor,
                            ),
                            Image.asset(
                              Assets.imagesArrowNext,
                              height: 16,
                              color: kSecondaryColor,
                            ),
                          ],
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
    );
  }
}
