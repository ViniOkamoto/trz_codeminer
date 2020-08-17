import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/trz_app.dart';

void main() async {
  await setupLocator();
  while (Platform.localeName == null) {
    await Future.delayed(const Duration(microseconds: 300), () {});
  }
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('pt', 'BR'),
      child: TRZApp(),
    ),
  );
}
