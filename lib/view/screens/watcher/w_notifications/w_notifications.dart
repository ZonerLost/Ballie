import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class WNotifications extends StatefulWidget {
  const WNotifications({super.key});

  @override
  State<WNotifications> createState() => _WNotificationsState();
}

class _WNotificationsState extends State<WNotifications> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Notifications'),
        body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kTertiaryColor.withValues(alpha: .2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CommonImageView(
                    height: 48,
                    width: 48,
                    radius: 16,
                    url: dummyImg,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Chelsea v Real Madrid',
                          size: 14,
                          weight: FontWeight.w600,
                          color: kSecondaryColor,
                        ),
                        MyText(
                          text: 'Upcoming match on.......',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                  ),
                  MyText(
                    text: '12:00 PM',
                    size: 12,
                    color: kSecondaryColor,
                    paddingRight: 6,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
