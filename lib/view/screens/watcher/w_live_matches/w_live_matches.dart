import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/watcher/w_live_matches/w_streaming/w_streaming_channels.dart';
import 'package:ballie/view/screens/watcher/w_notifications/w_notifications.dart';
import 'package:ballie/view/screens/watcher/w_live_matches/w_broadcast/w_broadcast.dart';
import 'package:ballie/view/screens/watcher/w_scan/w_scan.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WLiveMatches extends StatelessWidget {
  const WLiveMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          title: MyText(text: 'Live At Home'),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => WScan());
                },
                child: Image.asset(Assets.imagesScan, height: 28),
              ),
            ),
            SizedBox(width: 10),
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
        body: _CustomTabBar(),
      ),
    );
  }
}

class _CustomTabBar extends StatefulWidget {
  @override
  State<_CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<_CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['Broadcasts', 'Streaming'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            height: 48,
            width: 250,
            margin: AppSizes.DEFAULT,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: kTertiaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              spacing: 8,
              children: List.generate(tabs.length, (index) {
                final isSelected = selectedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? kSecondaryColor
                            : kTertiaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: MyText(
                          text: tabs[index],
                          size: 14,
                          color: isSelected ? kPrimaryColor : kTertiaryColor,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        // Tab content placeholder
        Expanded(
          child: selectedIndex == 0 ? WBroadcast() : WStreamingChannels(),
        ),
      ],
    );
  }
}
