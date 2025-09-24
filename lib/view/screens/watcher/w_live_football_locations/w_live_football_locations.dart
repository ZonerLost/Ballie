import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/watcher/w_live_football_locations/w_match_screening.dart';
import 'package:ballie/view/screens/watcher/w_live_football_locations/w_venues_in_your_area.dart';
import 'package:ballie/view/screens/watcher/w_notifications/w_notifications.dart';
import 'package:ballie/view/screens/watcher/w_scan/w_scan.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class WLiveFootballLocations extends StatelessWidget {
  const WLiveFootballLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Image.asset(
              Assets.imagesDummyMap,
              height: Get.height,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            ...List.generate(4, (index) {
              final random = UniqueKey().hashCode;
              final top = (random % (Get.height - 56)).toDouble();
              final left = ((random ~/ 2) % (Get.width - 56)).toDouble();
              return Positioned(
                top: top,
                left: left,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => WMatchScreening());
                  },
                  child: Image.asset(Assets.imagesMarker, height: 56),
                ),
              );
            }),

            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    Get.to(() => WVenuesInYourArea());
                  },
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
                    fillColor: kPrimaryColor,
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
          ],
        ),
      ),
    );
  }
}
