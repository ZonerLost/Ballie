import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';

AppBar simpleAppBar({
  bool haveLeading = true,
  bool centerTitle = false,
  String? title,
  Color? bgColor,
  final Widget? leading,
  List<Widget>? actions,
  VoidCallback? onLeadingTap,
}) {
  return AppBar(
    elevation: 0,
    titleSpacing: 10,
    backgroundColor: bgColor ?? Colors.transparent,
    automaticallyImplyLeading: false,
    centerTitle: centerTitle,
    leading: haveLeading
        ? leading ??
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: onLeadingTap ?? () => Get.back(),
                      child: Image.asset(Assets.imagesArrowBack, height: 32),
                    ),
                  ),
                ],
              )
        : null,
    title: MyText(
      text: title ?? '',
      size: 16,
      weight: FontWeight.w600,
      color: kTertiaryColor,
    ),
    actions: actions,
  );
}
