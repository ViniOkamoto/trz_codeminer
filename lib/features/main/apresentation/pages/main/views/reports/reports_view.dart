import 'package:flutter/material.dart';
import 'package:trzapp/core/values/colors.dart';

class ReportsView extends StatefulWidget {
  @override
  _ReportsViewState createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: whiteColor,
          child: Text("reports"),
        ),
      ],
    );
  }
}
