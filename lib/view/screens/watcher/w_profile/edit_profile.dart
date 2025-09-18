import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Profile Settings'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CommonImageView(
                    height: 100,
                    width: 100,
                    url: dummyImg,
                    radius: 100,
                    fit: BoxFit.cover,
                  ),
                  Center(child: Image.asset(Assets.imagesCamera, height: 30)),
                ],
              ),
            ),
            SizedBox(height: 12),
            MyText(
              text: 'Jhon Doe',
              size: 18,
              weight: FontWeight.w600,
              textAlign: TextAlign.center,
              color: kSecondaryColor,
            ),
            MyText(
              textAlign: TextAlign.center,
              text: 'example@email.com',
              size: 12,
              color: kQuaternaryColor,
              paddingBottom: 20,
            ),
            BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...List.generate(5, (index) {
                      final fields = [
                        {'label': 'Full Name', 'value': 'Jhon Doe'},
                        {'label': 'D.O.B', 'value': '02/02/1999'},
                        {'label': 'Email', 'value': 'example@email.com'},
                        {'label': 'Phone Number', 'value': '+1 (000) 000 0000'},
                      ];
                      if (index >= fields.length) return SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: MyText(
                                text: fields[index]['label']!,
                                size: 16,
                                weight: FontWeight.w500,
                              ),
                            ),
                            MyText(
                              text: fields[index]['value']!,
                              color: kQuaternaryColor,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyButton(buttonText: 'Save', onTap: () {}),
              MyText(
                paddingTop: 30,
                text: 'Edit',
                size: 16,
                fontFamily: AppFonts.ANTA,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
