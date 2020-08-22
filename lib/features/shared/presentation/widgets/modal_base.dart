import 'package:flutter/material.dart';

class ModalBase extends StatelessWidget {
  final Widget widgets;

  ModalBase({@required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                "assets/images/widgets/modal.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 15,
              bottom: 22,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, false);
                    },
                    child: Image.asset(
                      "assets/images/icons/arrow_icon_black.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                this.widgets
              ],
            ),
          ),
        ),
      ),
    );
  }
}
