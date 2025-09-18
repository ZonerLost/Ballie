import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/watcher/w_live_matches/w_account_details.dart';
import 'package:ballie/view/screens/watcher/w_live_matches/w_broadcast/w_all_broadcast_channels.dart';
import 'package:ballie/view/screens/watcher/w_live_matches/w_streaming/w_all_streaming_channels.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/match_score_row_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WStreamingChannels extends StatefulWidget {
  const WStreamingChannels({super.key});

  @override
  State<WStreamingChannels> createState() => _WStreamingChannelsState();
}

class _WStreamingChannelsState extends State<WStreamingChannels> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        EasyDateTimeLinePicker.itemBuilder(
          firstDate: DateTime(2025, 1, 1),
          lastDate: DateTime(2030, 3, 18),
          focusedDate: _selectedDate,
          itemExtent: 70.0,
          physics: BouncingScrollPhysics(),
          headerOptions: HeaderOptions(
            headerBuilder: (context, date, onTap) {
              return SizedBox();
            },
          ),
          itemBuilder: (context, date, isSelected, isDisabled, isToday, onTap) {
            return GestureDetector(
              onTap: onTap,
              child: Container(
                width: 42,
                padding: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? kSecondaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyText(
                      text: [
                        'Mon',
                        'Tue',
                        'Wed',
                        'Thu',
                        'Fri',
                        'Sat',
                        'Sun',
                      ][date.weekday - 1],
                      size: 14,
                      weight: FontWeight.w500,
                      color: isSelected ? kPrimaryColor : kTertiaryColor,
                    ),
                    MyText(
                      text: date.day.toString(),
                      size: 15,
                      fontFamily: AppFonts.ANTA,
                      color: isSelected ? kPrimaryColor : kTertiaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
          onDateChange: (date) {
            setState(() {
              _selectedDate = date;
            });
          },
        ),
        SizedBox(height: 30),
        BlurContainer(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: 'Live Match',
                        size: 12,
                        weight: FontWeight.w600,
                      ),
                    ),
                    MyText(text: 'View All', size: 12),
                  ],
                ),
                SizedBox(height: 10),
                MatchScoreRow(),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: MyText(
                text: 'Streaming Platforms',
                size: 16,
                weight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => WAllStreamingChannels());
              },
              child: Image.asset(Assets.imagesArrowNextRoundedSm, height: 24),
            ),
          ],
        ),
        SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          padding: AppSizes.ZERO,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 100,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            final List<String> dummyImages = [
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
      ],
    );
  }
}
