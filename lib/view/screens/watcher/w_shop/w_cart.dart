import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_fonts.dart';
import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/main.dart';
import 'package:ballie/view/screens/watcher/w_profile/w_payment_method/w_payment_methods.dart';
import 'package:ballie/view/widget/common_image_view_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_check_box_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WCart extends StatefulWidget {
  const WCart({super.key});

  @override
  State<WCart> createState() => _WCartState();
}

class _WCartState extends State<WCart> {
  List<bool> selected = List.generate(4, (_) => true);
  List<bool> inCart = List.generate(4, (_) => true);

  int get selectedCount => selected.where((e) => e).length;
  int get totalAmount => selectedCount * 100;

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Cart'),
        body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemCount: inCart.length,
          padding: AppSizes.DEFAULT,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (!inCart[index]) return SizedBox.shrink();
            return Row(
              children: [
                CustomCheckBox(
                  isActive: selected[index],
                  onTap: () {
                    setState(() {
                      selected[index] = !selected[index];
                    });
                  },
                ),
                SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: kTertiaryColor.withValues(alpha: .2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          CommonImageView(
                            height: 40,
                            width: 40,
                            radius: 8,
                            url: dummyImg,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'Man City Jersey',
                                  size: 14,
                                  paddingBottom: 4,
                                  weight: FontWeight.w600,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.imagesPoint,
                                      height: 20,
                                      width: 20,
                                      color: kSecondaryColor,
                                    ),
                                    MyText(
                                      paddingLeft: 4,
                                      text: '100',
                                      size: 15,
                                      weight: FontWeight.w600,
                                      color: kSecondaryColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                inCart[index] = false;
                              });
                            },
                            child: Image.asset(
                              Assets.imagesTrash,
                              height: 22,
                              width: 22,
                              color: kSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kTertiaryColor.withValues(alpha: .2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyText(
                            text: '${selectedCount} x items selected',
                            size: 12,
                            color: kSecondaryColor,
                            paddingBottom: 4,
                          ),
                          MyText(
                            text: 'Total Amount',
                            size: 14,
                            paddingBottom: 4,
                            weight: FontWeight.w600,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                Assets.imagesPoint,
                                height: 20,
                                width: 20,
                                color: kSecondaryColor,
                              ),
                              MyText(
                                paddingLeft: 4,
                                text: totalAmount.toString(),
                                size: 15,
                                weight: FontWeight.w600,
                                color: kSecondaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => WPaymentMethods());
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: MyText(
                            text: 'Checkout',
                            size: 14,
                            color: kPrimaryColor,
                            fontFamily: AppFonts.ANTA,
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
      ),
    );
  }
}
