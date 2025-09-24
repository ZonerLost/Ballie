import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_check_box_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WWallpapers extends StatefulWidget {
  const WWallpapers({super.key});

  @override
  State<WWallpapers> createState() => _WWallpapersState();
}

class _WWallpapersState extends State<WWallpapers> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Wallpapers'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            MyText(
              text: 'Select a wallpaper to apply on the app as a theme',
              paddingBottom: 20,
              size: 14,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: AppSizes.ZERO,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: CommonImageView(
                        url: dummyImg,
                        height: Get.height,
                        width: Get.width,
                        fit: BoxFit.cover,
                        radius: 10,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CustomCheckBox(
                        isActive: selectedIndex == index,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        isRadio: true,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Image.asset(Assets.imagesDel, height: 32),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
