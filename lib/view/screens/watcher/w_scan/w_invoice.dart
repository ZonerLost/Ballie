import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/match_score_row_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class WInvoice extends StatelessWidget {
  const WInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        appBar: simpleAppBar(title: 'Invoice'),
        backgroundColor: Colors.transparent,
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          children: [
            BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CommonImageView(
                          height: 38,
                          width: 38,
                          radius: 100,
                          imagePath: Assets.imagesCl,
                        ),
                      ],
                    ),
                    MyText(
                      paddingTop: 10,
                      text: 'UEFA Champions League',
                      size: 14,
                      weight: FontWeight.w600,
                      paddingBottom: 20,
                    ),
                    MatchScoreRow(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Items',
                      size: 14,
                      weight: FontWeight.w600,
                      paddingBottom: 20,
                    ),
                    ...List.generate(3, (index) {
                      final items = [
                        {'name': '1 x Pepperoni Pizza (L)', 'price': '\$5.99'},
                        {'name': '5 x Peach Iced Tea', 'price': '\$5.99'},
                        {'name': 'Discounts', 'price': '50%'},
                      ];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: MyText(text: '${items[index]['name']}'),
                            ),
                            MyText(text: '${items[index]['price']}', size: 12),
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: MyText(
                            text: 'Total',
                            size: 18,
                            fontFamily: AppFonts.ANTA,
                          ),
                        ),
                        MyText(
                          text: '\$5.99',
                          size: 18,
                          color: kSecondaryColor,
                          fontFamily: AppFonts.ANTA,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(buttonText: 'Pay', onTap: () {}),
        ),
      ),
    );
  }
}
