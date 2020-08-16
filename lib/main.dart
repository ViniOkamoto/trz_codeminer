import 'package:flutter/material.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/trz_app.dart';

void main() async {
  await setupLocator();
  runApp(TRZApp());
}
