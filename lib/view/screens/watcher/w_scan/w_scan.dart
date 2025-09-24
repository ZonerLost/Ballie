import 'package:ballie/constants/app_images.dart';
import 'package:ballie/view/screens/watcher/w_scan/w_invoice.dart';
import 'package:ballie/view/widget/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class WScan extends StatefulWidget {
  const WScan({super.key});

  @override
  State<WScan> createState() => _WScanState();
}

class _WScanState extends State<WScan> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(() => WInvoice());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Scan'),
      body: Image.asset(
        Assets.imagesScanDummy,
        height: Get.height,
        width: Get.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
