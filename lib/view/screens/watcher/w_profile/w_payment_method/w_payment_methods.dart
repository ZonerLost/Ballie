import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/watcher/w_profile/w_payment_method/w_add_new_method.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class WPaymentMethods extends StatelessWidget {
  const WPaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Payment Methods'),
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          shrinkWrap: true,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            final _items = [
              {'icon': Assets.imagesMaster, 'title': 'VISA / Mastercard'},
              {'icon': Assets.imagesApplePay, 'title': 'Apple Pay'},
              {'icon': Assets.imagesPaypal, 'title': 'PayPal'},
              {'icon': Assets.imagesStripe, 'title': 'Stripe'},
            ];
            return GestureDetector(
              onTap: () {
                index == 0 ? Get.to(() => WAddNewMethod()) : null;
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: kTertiaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Image.asset(_items[index]['icon'] ?? '', height: 24),
                    Expanded(
                      child: MyText(
                        paddingLeft: 10,
                        text: _items[index]['title'] ?? '',
                        size: 14,
                      ),
                    ),
                    Image.asset(Assets.imagesArrowNextRounded, height: 24),
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
