import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool locationAccess = false;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Location'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: kTertiaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: MyText(text: 'Allow location access', size: 14),
                  ),
                  SizedBox(
                    height: 25,
                    child: Transform.scale(
                      scale: 0.62,
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 25 / 0.62,
                        width: 25 / 0.62,
                        child: CupertinoSwitch(
                          activeTrackColor: kSecondaryColor,
                          value: locationAccess,
                          onChanged: (val) {
                            setState(() {
                              locationAccess = val;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
