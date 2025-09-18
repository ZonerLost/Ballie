import 'package:ballie/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class WScan extends StatelessWidget {
  const WScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        Assets.imagesScanDummy,
        height: Get.height,
        width: Get.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
