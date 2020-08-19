import 'package:flutter/material.dart';
import 'package:trzapp/core/values/colors.dart';

class AppInput extends StatelessWidget {
  AppInput({
    @required this.controller,
    @required this.onChanged,
    @required this.hintText,
    this.textColor = whiteColor,
    this.fontSize = 18,
    this.keyboardType = TextInputType.text,
  });

  final Color textColor;
  final String hintText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final double fontSize;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 2,
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: TextStyle(color: whiteColor, fontSize: fontSize),
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: whiteColor),
      ),
    );
  }
}
