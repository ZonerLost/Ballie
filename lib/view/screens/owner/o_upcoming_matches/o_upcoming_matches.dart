import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/owner/o_notifications/o_notifications.dart';
import 'package:ballie/view/screens/watcher/w_notifications/w_notifications.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/match_score_row_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OUpcomingMatches extends StatefulWidget {
  const OUpcomingMatches({super.key});

  @override
  State<OUpcomingMatches> createState() => _OUpcomingMatchesState();
}

class _OUpcomingMatchesState extends State<OUpcomingMatches> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          title: MyText(text: 'Upcoming Matches'),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ONotifications());
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
              itemBuilder:
                  (context, date, isSelected, isDisabled, isToday, onTap) {
                    return GestureDetector(
                      onTap: onTap,
                      child: Container(
                        width: 42,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? kSecondaryColor
                              : Colors.transparent,
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
                              color: isSelected
                                  ? kPrimaryColor
                                  : kTertiaryColor,
                            ),
                            MyText(
                              text: date.day.toString(),
                              size: 15,
                              fontFamily: AppFonts.ANTA,
                              color: isSelected
                                  ? kPrimaryColor
                                  : kTertiaryColor,
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
            SizedBox(height: 20),
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
                    SizedBox(height: 10),

                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: MyText(
                          text: 'Danish Bar',
                          size: 12,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    MatchScoreRow(),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: MyText(
                          text: 'Whismas Club',
                          size: 12,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: kPurpleColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'Upcoming matches',
                          size: 12,
                          weight: FontWeight.w600,
                        ),
                      ),
                      MyText(text: 'View All', size: 12),
                    ],
                  ),
                  SizedBox(height: 10),
                  ...List.generate(3, (i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        spacing: 50,
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
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MyText(text: 'VS', size: 16, weight: FontWeight.w700),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: 'RMD',
                                    size: 12,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
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
