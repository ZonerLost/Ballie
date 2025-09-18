import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/owner/o_home/o_league_matches.dart';
import 'package:ballie/view/screens/watcher/w_home/w_league_matches.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OAllLeagues extends StatelessWidget {
  const OAllLeagues({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Leagues'),
        body: GridView.builder(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 135,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 25,
          itemBuilder: (context, index) {
            final List<String> images = List.generate(
              25,
              (i) => Assets.imagesEpl,
            );
            final List<String> titles = List.generate(
              25,
              (i) => 'League ${i + 1}',
            );
            return GestureDetector(
              onTap: () {
                Get.to(() => OLeagueMatches());
              },
              child: BlurContainer(
                radius: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonImageView(
                        imagePath: images[index],
                        height: 48,
                        width: 48,
                        fit: BoxFit.cover,
                        radius: 100,
                      ),
                      SizedBox(height: 10),
                      MyText(
                        text: titles[index],
                        size: 12,
                        lineHeight: 1.5,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
