import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trzapp/core/router.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/routes.dart';

class TRZApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uzzipay',
      onGenerateRoute: RouterApp.generateRoute,
      initialRoute: Routes.splash,
      theme: ThemeData(
        fontFamily: "Retro Computer",
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
      ),
    );
  }
}
