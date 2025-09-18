import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/watcher/w_live_matches/w_account_details.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WAllStreamingChannels extends StatelessWidget {
  const WAllStreamingChannels({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'All Streaming Platforms'),
        body: GridView.builder(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 100,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 16,
          itemBuilder: (context, index) {
            final List<String> dummyImages = [
              Assets.imagesPrimeVideo,
              Assets.imagesHulu,
              Assets.imagesSs,
              Assets.imagesFubo,
              Assets.imagesPrimeVideo,
              Assets.imagesHulu,
              Assets.imagesSs,
              Assets.imagesFubo,
              Assets.imagesPrimeVideo,
              Assets.imagesHulu,
              Assets.imagesSs,
              Assets.imagesFubo,
              Assets.imagesPrimeVideo,
              Assets.imagesHulu,
              Assets.imagesSs,
              Assets.imagesFubo,
            ];
            return GestureDetector(
              onTap: () {
                Get.to(() => WAccountDetails());
              },
              child: CommonImageView(
                height: Get.height,
                width: Get.width,
                radius: 10,
                fit: BoxFit.cover,
                imagePath: dummyImages[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
