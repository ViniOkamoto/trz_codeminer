import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/gender/widgets/select_gender.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/stores/gender/gender_store.dart';

class GenderView extends StatelessWidget {
  final GenderStore _store = GenderStore();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.072),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.047,
                bottom: size.height * 0.023,
              ),
              child: Center(
                child: Image.asset(
                  "assets/images/trz_logo.png",
                  width: size.width * 0.274,
                  height: size.width * 0.274,
                ),
              ),
            ),
            Container(
              height: size.width * 0.35,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 150),
                      totalRepeatCount: 1,
                      text: [
                        'PAGES.CREATE_ACCOUNT.GENDER.HEADER'.tr(),
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
                  Observer(
                    builder: (_) {
                      if (_store.firstTextFinished)
                        return Padding(
                          padding: EdgeInsets.only(top: size.height * 0.04),
                          child: SizedBox(
                            child: TypewriterAnimatedTextKit(
                              speed: Duration(milliseconds: 100),
                              totalRepeatCount: 1,
                              isRepeatingAnimation: false,
                              text: [
                                'PAGES.CREATE_ACCOUNT.GENDER.DESCRIPTION'.tr(),
                              ],
                              textStyle: TextStyle(
                                fontSize: size.width * FONT_SIZE_12,
                                color: whiteColor,
                              ),
                              textAlign: TextAlign.center,
                              onFinished: () {
                                _store.secondTextFinished = true;
                              },
                            ),
                          ),
                        );
                      return Container();
                    },
                  ),
                  Observer(
                    builder: (_) {
                      if (_store.secondTextFinished)
                        return Padding(
                          padding: EdgeInsets.only(top: size.height * 0.04),
                          child: SizedBox(
                            child: TypewriterAnimatedTextKit(
                              speed: Duration(milliseconds: 100),
                              totalRepeatCount: 1,
                              isRepeatingAnimation: false,
                              text: [
                                'PAGES.CREATE_ACCOUNT.GENDER.HINT'.tr(),
                              ],
                              textStyle: TextStyle(
                                fontSize: size.width * FONT_SIZE_12,
                                color: whiteColor,
                              ),
                              textAlign: TextAlign.center,
                              alignment: AlignmentDirectional.center,
                            ),
                          ),
                        );
                      return Container();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            SelectGender(size: size, store: _store),
          ],
        ),
      ),
    );
  }
}
