import 'dart:ui';
import 'package:ballie/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    super.key,
    required this.child,
    this.height,
    this.bgColor,
    this.radius,
  });
  final Widget child;
  final double? height;
  final Color? bgColor;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          height: height ?? null,
          decoration: BoxDecoration(
            color: bgColor ?? kTertiaryColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(radius ?? 20),
          ),
          child: child,
        ),
      ),
    );
  }
}
