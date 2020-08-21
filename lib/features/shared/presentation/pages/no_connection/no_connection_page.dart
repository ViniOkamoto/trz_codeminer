import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/routes.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_button.dart';

class NoConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      "ERROR.ERROR_CONNECTION".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.splash);
            },
            text: "COMMON.RETRY".tr(),
          ),
        ],
      ),
    );
  }
}
