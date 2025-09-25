import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_check_box_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ...existing code...

class OEditVenueDetails extends StatefulWidget {
  const OEditVenueDetails({super.key});

  @override
  State<OEditVenueDetails> createState() => _OEditVenueDetailsState();
}

class _OEditVenueDetailsState extends State<OEditVenueDetails> {
  int currentSelected = 0;
  List<bool> nextMatchEnabled = List.generate(3, (_) => true);
  List<bool> offersEnabled = List.generate(3, (_) => true);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Danish Bar'),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Current Match Screening',
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                    ...List.generate(2, (index) {
                      return Row(
                        spacing: 16,
                        children: [
                          CustomCheckBox(
                            isActive: currentSelected == index,
                            onTap: () {
                              setState(() {
                                currentSelected = index;
                              });
                            },
                            isRadio: true,
                          ),
                          Expanded(
                            child: BlurContainer(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        CommonImageView(
                                          height: 28,
                                          width: 28,
                                          radius: 100,
                                          fit: BoxFit.cover,
                                          url: dummyImg,
                                        ),
                                      ],
                                    ),
                                    MyText(
                                      paddingTop: 10,
                                      paddingBottom: 10,
                                      text: 'UEFA Champions League',
                                      size: 14,
                                      weight: FontWeight.w500,
                                    ),
                                    Row(
                                      children: [
                                        CommonImageView(
                                          height: 32,
                                          width: 32,
                                          radius: 100,
                                          fit: BoxFit.cover,
                                          url: dummyImg,
                                        ),
                                        Expanded(
                                          child: MyText(
                                            text: 'RMD',
                                            size: 14,
                                            weight: FontWeight.w500,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        MyText(
                                          text: 'VS',
                                          size: 16,
                                          weight: FontWeight.w700,
                                          textAlign: TextAlign.center,
                                        ),
                                        Expanded(
                                          child: MyText(
                                            text: 'RMD',
                                            size: 14,
                                            weight: FontWeight.w500,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        CommonImageView(
                                          height: 32,
                                          width: 32,
                                          radius: 100,
                                          fit: BoxFit.cover,
                                          url: dummyImg,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Next Match Screening',
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                    ...List.generate(3, (index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: index == 1
                                    ? Color(0xffFF383C)
                                    : index == 2
                                    ? Color(0xffFF8D28)
                                    : kPurpleColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Row(
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
                                            weight: FontWeight.w500,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  MyText(
                                    text: 'VS',
                                    size: 14,
                                    weight: FontWeight.w700,
                                    textAlign: TextAlign.center,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: MyText(
                                            text: 'RMD',
                                            size: 12,
                                            weight: FontWeight.w500,
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
                            ),
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
                                  value: nextMatchEnabled[index],
                                  onChanged: (val) {
                                    setState(() {
                                      nextMatchEnabled[index] = val;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Next Match Screening',
                      size: 14,
                      weight: FontWeight.w600,
                    ),
                    ...List.generate(3, (index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kTertiaryColor.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(Assets.imagesQr, height: 48),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        MyText(
                                          text: 'Danish Bar',
                                          size: 12,
                                          weight: FontWeight.w600,
                                          paddingBottom: 2,
                                        ),
                                        MyText(
                                          text: '50% off on drinks',
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                  value: offersEnabled[index],
                                  onChanged: (val) {
                                    setState(() {
                                      offersEnabled[index] = val;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
