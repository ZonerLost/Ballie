import 'package:ballie/constants/app_colors.dart';
import 'package:ballie/view/widget/my_text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 16.0,
    this.maxLines = 1,
    this.labelSize,
    this.prefix,
    this.suffix,
    this.isReadOnly,
    this.onTap,
    this.fillColor,
  }) : super(key: key);

  String? labelText, hintText;
  TextEditingController? controller;
  ValueChanged<String>? onChanged;
  bool? isObSecure, isReadOnly;
  double? marginBottom;
  int? maxLines;
  double? labelSize;
  Color? fillColor;
  Widget? prefix, suffix;
  final VoidCallback? onTap;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginBottom!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.labelText != null)
            MyText(
              text: widget.labelText ?? '',
              paddingBottom: 6,
              size: 12,
              color: kBorderColor,
              weight: FontWeight.w600,
            ),
          TextFormField(
            onTap: widget.onTap,
            textAlignVertical: widget.prefix != null || widget.suffix != null
                ? TextAlignVertical.center
                : null,
            cursorColor: kTertiaryColor,
            maxLines: widget.maxLines,
            readOnly: widget.isReadOnly ?? false,
            controller: widget.controller,
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.next,
            obscureText: widget.isObSecure!,
            obscuringCharacter: '*',
            style: TextStyle(fontSize: 14, color: kTertiaryColor),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  widget.fillColor ?? kTertiaryColor.withValues(alpha: 0.1),
              prefixIcon: widget.prefix,
              suffixIcon: widget.suffix,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: widget.maxLines! > 1 ? 15 : 0,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 14, color: kBorderColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: kBorderColor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: kBorderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: kBorderColor, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: kBorderColor, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: kBorderColor, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
