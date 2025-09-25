import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/auth/login.dart';
import 'package:ballie/view/screens/auth/login_as.dart';
import 'package:ballie/view/screens/watcher/w_profile/edit_profile.dart';
import 'package:ballie/view/screens/watcher/w_profile/language.dart';
import 'package:ballie/view/screens/watcher/w_profile/linked_profile.dart';
import 'package:ballie/view/screens/watcher/w_profile/location.dart';
import 'package:ballie/view/screens/watcher/w_profile/notifications_settings.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OProfile extends StatelessWidget {
  const OProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 20.0,
          automaticallyImplyLeading: false,
          title: MyText(text: 'Profile'),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesProfileCardBg),
                  fit: BoxFit.cover,
                ),
                border: Border.all(width: 1.0, color: kSecondaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CommonImageView(
                    height: 48,
                    width: 48,
                    radius: 100,
                    url: dummyImg,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyText(
                          text: 'Watcher Name',
                          size: 16,
                          color: kSecondaryColor,
                          weight: FontWeight.w600,
                        ),
                        SizedBox(height: 2),
                        MyText(
                          text: 'example@email.com',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MyText(
              paddingTop: 30,
              text: 'Account',
              size: 12,
              weight: FontWeight.w600,
              color: kQuaternaryColor,
              paddingBottom: 6,
            ),
            BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ProfileTile(
                      icon: Assets.imagesAccountSettings,
                      title: 'Account Settings',
                      onTap: () {
                        Get.to(() => EditProfile());
                      },
                    ),
                    _ProfileTile(
                      icon: Assets.imagesLinked,
                      title: 'Linked Accounts',
                      onTap: () {
                        Get.to(() => LinkedAccounts());
                      },
                    ),
                  ],
                ),
              ),
            ),

            MyText(
              paddingTop: 20,
              text: 'App',
              size: 12,
              weight: FontWeight.w600,
              color: kQuaternaryColor,
              paddingBottom: 6,
            ),
            BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ProfileTile(
                      icon: Assets.imagesNotificationIcon,
                      title: 'Notifications',
                      onTap: () {
                        Get.to(() => NotificationsSettings());
                      },
                    ),
                    _ProfileTile(
                      icon: Assets.imagesLocationIcon,
                      title: 'Location',
                      onTap: () {
                        Get.to(() => Location());
                      },
                    ),
                    _ProfileTile(
                      icon: Assets.imagesLanguage,
                      title: 'Language',
                      onTap: () {
                        Get.to(() => Languages());
                      },
                    ),
                    // _ProfileTile(
                    //   icon: Assets.imagesFont,
                    //   title: 'Font',
                    //   onTap: () {},
                    // ),
                    _ProfileTile(
                      icon: Assets.imagesAppFeedback,
                      title: 'App Feedback',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            BlurContainer(
              bgColor: kSecondaryColor.withValues(alpha: 0.2),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ProfileTile(
                      icon: Assets.imagesDeactivate,
                      title: 'Deactivate Account',
                      onTap: () {},
                    ),
                    _ProfileTile(
                      icon: Assets.imagesLogout,
                      title: 'Log Out',
                      onTap: () {
                        Get.offAll(() => LoginAs());
                      },
                    ),
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

class _ProfileTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(icon, height: 22),
          Expanded(child: MyText(text: title, paddingLeft: 12)),
          Image.asset(Assets.imagesArrowNextRounded, height: 32),
        ],
      ),
    );
  }
}
