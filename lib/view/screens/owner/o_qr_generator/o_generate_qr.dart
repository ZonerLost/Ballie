import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/screens/owner/o_qr_generator/o_qr_preview.dart';
import 'package:ballie/view/widget/blur_container_widget.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/custom_container_widget.dart';
import 'package:ballie/view/widget/custom_drop_down_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:ballie/view/widget/my_text_field_widget.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OGenerateQr extends StatelessWidget {
  const OGenerateQr({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'Generate QR'),
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
                    MyText(
                      text: 'Create Deals',
                      size: 12,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 20),
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: CustomDropDown(
                            labelText: 'Venue',
                            hint: 'Danish Bar',
                            items: ['Danish Bar'],
                            onChanged: (val) {},
                            selectedValue: 'Danish Bar',
                          ),
                        ),
                        Expanded(
                          child: CustomDropDown(
                            labelText: 'Deal on',
                            hint: 'Food',
                            items: ['Food'],
                            onChanged: (val) {},
                            selectedValue: 'Food',
                          ),
                        ),
                      ],
                    ),
                    CustomDropDown(
                      labelText: 'Items',
                      hint: 'Iced Tea',
                      items: ['Iced Tea'],
                      onChanged: (val) {},
                      selectedValue: 'Iced Tea',
                      marginBottom: 12,
                    ),
                    Wrap(
                      spacing: 8,
                      children: List.generate(2, (index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: MyText(
                            text: index == 0 ? 'Pizza' : 'Pancakes',
                            size: 12,
                            color: kPrimaryColor,
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 16),
                    MyTextField(
                      labelText: 'Discount',
                      hintText: '50%',
                      marginBottom: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(
            buttonText: 'Generate QR',
            onTap: () {
              Get.to(() => OQrPreview());
            },
          ),
        ),
      ),
    );
  }
}
