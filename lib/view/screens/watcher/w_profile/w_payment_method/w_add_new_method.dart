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

class WAddNewMethod extends StatelessWidget {
  const WAddNewMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer2(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: simpleAppBar(title: 'VISA / Mastercard'),
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
                    CustomDropDown(
                      labelText: 'Bank',
                      hint: 'Bank of America',
                      items: ['Bank of America'],
                      onChanged: (val) {},
                      selectedValue: 'Bank of America',
                      marginBottom: 12,
                    ),
                    MyTextField(
                      labelText: 'Name of holder',
                      hintText: 'Jhon Doe',
                      marginBottom: 12,
                    ),
                    MyTextField(
                      labelText: 'Card Number',
                      hintText: '1234 5678 9012',
                      marginBottom: 12,
                    ),
                    MyTextField(
                      labelText: 'Exp. Date',
                      hintText: 'MM/YY',
                      marginBottom: 12,
                    ),
                    MyTextField(
                      labelText: 'CVV',
                      hintText: '123',
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
          child: MyButton(buttonText: 'Save', onTap: () {}),
        ),
      ),
    );
  }
}
