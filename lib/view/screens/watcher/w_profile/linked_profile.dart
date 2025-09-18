import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class LinkedAccounts extends StatelessWidget {
  const LinkedAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Linked Accounts'),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            final linkedAccounts = [
              {'icon': Assets.imagesGoogleIcon, 'title': 'example@email.com'},
              {'icon': Assets.imagesFacebookIcon, 'title': '/jhondoe'},
              {'icon': Assets.imagesWhatsApp, 'title': '+1 (000) 000 0000'},
              {'icon': Assets.imagesInstagram, 'title': '@jhondoe'},
              {'icon': Assets.imagesSnapchat, 'title': '@jhondoe'},
            ];
            return Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: kTertiaryColor.withValues(alpha: 0.1),
                border: Border.all(color: kQuaternaryColor, width: 1.0),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Image.asset(linkedAccounts[index]['icon'] ?? '', height: 24),
                  Expanded(
                    child: MyText(
                      paddingLeft: 10,
                      text: linkedAccounts[index]['title'] ?? '',
                      size: 14,
                    ),
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
