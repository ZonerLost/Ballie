import 'package:ballie/constants/app_fonts.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'my_text_widget.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.weight,
    this.radius,
    this.customChild,
    this.bgColor,
    this.textColor,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize, radius;
  FontWeight? weight;
  Widget? customChild;
  Color? bgColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 50),
        color: bgColor ?? kSecondaryColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kWhiteColor.withValues(alpha: 0.1),
          highlightColor: kWhiteColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(radius ?? 50),
          child:
              customChild ??
              Center(
                child: MyText(
                  text: buttonText,
                  size: textSize ?? 15,
                  fontFamily: AppFonts.ANTA,
                  weight: weight ?? null,
                  color: textColor ?? kPrimaryColor,
                ),
              ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyBorderButton extends StatelessWidget {
  MyBorderButton({
    required this.buttonText,
    required this.onTap,
    this.height = 48,
    this.textSize,
    this.weight,
    this.child,
    this.radius,
    this.buttonColor,
    this.textColor,
  });

  final String buttonText;
  final VoidCallback onTap;
  double? height, textSize;
  FontWeight? weight;
  Widget? child;
  double? radius;
  final Color? buttonColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 50),
        border: Border.all(width: 1.0, color: textColor ?? kSecondaryColor),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kSecondaryColor.withValues(alpha: 0.1),
          highlightColor: kSecondaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(radius ?? 50),
          child: child != null
              ? child
              : Center(
                  child: MyText(
                    text: buttonText,
                    size: textSize ?? 15,
                    fontFamily: AppFonts.ANTA,
                    weight: weight ?? null,
                    color: textColor ?? kSecondaryColor,
                  ),
                ),
        ),
      ),
    );
  }
}

class SimpleToggleButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SimpleToggleButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Color(0xffDEDEDE)),
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? kSecondaryColor : Color(0xffFAFAFA),
        ),
        child: MyText(
          color: kSecondaryColor,
          size: 12,
          textAlign: TextAlign.center,
          text: title,
        ),
      ),
    );
  }
}
