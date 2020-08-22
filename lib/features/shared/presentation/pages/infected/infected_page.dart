import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/utils/shared_prefs.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/core/values/routes.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_button.dart';

class InfectedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.1),
                      child: Text(
                        "PAGES.INFECTED.INFECTED".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: size.width * FONT_SIZE_18),
                      ),
                    ),
                    Container(
                      child: Text(
                        "PAGES.INFECTED.GAME_OVER".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: size.width * FONT_SIZE_18),
                      ),
                    ),
                    Image.asset("assets/gifs/horde_tweeteds.gif")
                  ],
                )
              ],
            ),
          ),
          AppButton(
            onPressed: () {
              SharedPrefs.remove("id");
              Navigator.pushReplacementNamed(context, Routes.splash);
            },
            text: "COMMON.RETRY".tr(),
          ),
        ],
      ),
    );
  }
}
