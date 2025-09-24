import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

class WUpgradeAccount extends StatelessWidget {
  const WUpgradeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final plans = [
      {
        'title': 'Free Account',
        'amount': '€0.00',
        'access': 'Limited Access',
        'features': [
          '3 favorite clubs',
          '2 favorite cafes/bars',
          'Ads',
          '50 Ballie Coins per week',
          '5 friends following',
        ],
        'button': 'Current Plan',
      },
      {
        'title': 'Premium Account',
        'amount': '€1.99',
        'access': 'Standard Access',
        'features': [
          '10 favorite clubs',
          '5 favorite cafes/bars',
          'No ads',
          '200 Ballie Coins per week',
          '3 extra themes',
          'Exclusive Content',
          'Unlimited friends following',
          'Local bar deals',
        ],
        'button': 'Choose Plan',
      },
      {
        'title': 'Diamond Account',
        'amount': '€4.99',
        'access': 'Full Access',
        'features': [
          'Unlimited favorite clubs',
          'Unlimited favorite cafes/bars',
          'No ads',
          '500 Ballie Coins per week',
          '10 extra themes',
          'Exclusive Content',
          'Unlimited friends following',
          'Local bar deals',
          'New features early access',
        ],
        'button': 'Choose Plan',
      },
    ];

    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Upgrade Account'),
        body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: plans.length,
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final plan = plans[index];
            return BlurContainer(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              MyText(
                                text: plan['title'] as String? ?? '',
                                size: 16,
                                color: kSecondaryColor,
                                weight: FontWeight.w600,
                                paddingBottom: 2,
                              ),
                              MyText(text: plan['access'] as String? ?? ''),
                            ],
                          ),
                        ),
                        MyText(
                          text: plan['amount'] as String? ?? '',
                          size: 16,
                          color: kSecondaryColor,
                          weight: FontWeight.w600,
                        ),
                        MyText(
                          paddingLeft: 10,
                          text: '/month',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: kQuaternaryColor,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                    ...(plan['features'] as List<String>).map((feature) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: kTertiaryColor),
                            SizedBox(width: 8),
                            Expanded(child: MyText(text: feature)),
                          ],
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 14),
                    index != 0
                        ? MyBorderButton(
                            buttonText: 'Choose Plan',
                            onTap: () {},
                          )
                        : MyButton(
                            buttonText: plan['button'] as String? ?? '',
                            onTap: () {},
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
