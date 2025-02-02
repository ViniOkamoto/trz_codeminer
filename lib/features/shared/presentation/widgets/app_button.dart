import 'package:flutter/material.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final bool btnIsValid;
  final String text;

  const AppButton({
    this.btnIsValid = true,
    @required this.onPressed,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.56,
      height: size.width * 0.13,
      child: RaisedButton(
        onPressed: btnIsValid ? onPressed : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(color: whiteColor),
        ),
        color: primaryColor,
        child: Center(
          child: FittedBox(
            child: Text(
              "$text",
              style: TextStyle(
                fontSize: size.width * FONT_SIZE_18,
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
