import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/age/widgets/put_age.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/widgets/header_views.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/stores/age/age_store.dart';

class AgeView extends StatelessWidget {
  final AgeStore _store = AgeStore();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.072),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderViews(),
            Container(
              height: size.width * 0.37,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 150),
                      totalRepeatCount: 1,
                      text: [
                        'PAGES.CREATE_ACCOUNT.AGE.HEADER'.tr(),
                      ],
                      isRepeatingAnimation: false,
                      onFinished: () {
                        _store.firstTextFinished = true;
                      },
                      textStyle: TextStyle(
                        fontSize: size.width * FONT_SIZE_12,
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  PutAge(store: _store, size: size),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Observer(
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Image.asset(
                          _store.createAccountStore.person.gender != "F"
                              ? "assets/images/boy_pointing_out.png"
                              : "assets/images/girl_pointing_out.png",
                          width: _store.createAccountStore.person.gender != "F"
                              ? size.width * 0.215
                              : size.width * 0.28,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
