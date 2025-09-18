import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/owner/o_notifications/o_notifications.dart';
import 'package:ballie/view/screens/owner/o_venue/o_match_screening.dart';
import 'package:ballie/view/screens/owner/o_venue/o_venue_detail.dart';
import 'package:ballie/view/screens/watcher/w_notifications/w_notifications.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/match_score_row_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OVenue extends StatefulWidget {
  const OVenue({super.key});

  @override
  State<OVenue> createState() => _OVenueState();
}

class _OVenueState extends State<OVenue> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          title: MyText(text: 'Venues'),
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
            GestureDetector(
              onTap: () {
                Get.to(() => OVenueDetail());
              },
              child: _VenueScreening(),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.to(() => OMatchScreening());
              },
              child: _VenueScreening(),
            ),
            SizedBox(height: 20),
            BlurContainer(
              radius: 10,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Marked for Screening',
                      size: 12,
                      weight: FontWeight.w600,
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
                            MyText(
                              text: '16:00',
                              size: 16,
                              color: kSecondaryColor,
                              weight: FontWeight.w700,
                            ),
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
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _VenueScreening extends StatelessWidget {
  const _VenueScreening({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      radius: 14,
      child: Container(
        height: 210,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                children: [
                  CommonImageView(
                    imagePath: Assets.imagesDummyMap,
                    width: Get.width,
                    fit: BoxFit.cover,
                    radius: 10,
                  ),
                  Center(
                    child: Image.asset(
                      Assets.imagesVenueScreeningMarker,
                      height: 56,
                    ),
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 10,
              textAlign: TextAlign.left,
              text: 'Danish Bar',
              size: 14,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
