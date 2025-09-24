import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_field_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OAddVenue extends StatelessWidget {
  const OAddVenue({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Add Venue'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            BlurContainer(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Mark your Venue',
                      size: 16,
                      weight: FontWeight.w500,
                      paddingBottom: 12,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CommonImageView(
                          height: 400,
                          imagePath: Assets.imagesDummyMap,
                          width: Get.width,
                          fit: BoxFit.cover,
                          radius: 10,
                        ),
                        Image.asset(Assets.imagesMarker, height: 56),
                      ],
                    ),
                    SizedBox(height: 12),
                    BlurContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MyText(
                              text: 'Add image',
                              size: 14,
                              weight: FontWeight.w500,
                              paddingBottom: 12,
                            ),
                            Image.asset(Assets.imagesAddImage, height: 56),
                            MyText(
                              paddingTop: 8,
                              text: 'Tap to add details',
                              size: 12,
                              color: kQuaternaryColor,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    MyTextField(
                      labelText: 'Venue Location',
                      hintText: 'Choose on map',
                      suffix: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.imagesLocationIcon, height: 20),
                        ],
                      ),
                    ),
                    MyTextField(
                      labelText: 'Venue Name',
                      hintText: 'Danish Bar',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(buttonText: 'Add Venue', onTap: () {}),
        ),
      ),
    );
  }
}
