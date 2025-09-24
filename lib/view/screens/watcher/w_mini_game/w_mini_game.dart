import 'package:ballie/constants/app_images.dart';
import 'package:ballie/constants/app_sizes.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:ballie/view/widget/my_button_widget.dart';
import 'package:flutter/material.dart';

class WMiniGame extends StatelessWidget {
  const WMiniGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Mini Game'),
      body: Column(
        children: [
          Expanded(child: Image.asset(Assets.imagesGoal)),
          Image.asset(Assets.imagesFootball, height: 160),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppSizes.DEFAULT,
        child: MyButton(buttonText: 'Kick', onTap: () {}),
      ),
    );
  }
}
