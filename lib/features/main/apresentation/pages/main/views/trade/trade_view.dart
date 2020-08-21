import 'package:flutter/cupertino.dart';
import 'package:trzapp/core/values/colors.dart';

class TradeView extends StatefulWidget {
  @override
  _TradeViewState createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: whiteColor,
          child: Text("Trade"),
        ),
      ],
    );
  }
}
