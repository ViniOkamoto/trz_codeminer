import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/packages/widgets/packages_list.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/widgets/header_views.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/stores/packages/packages_store.dart';

class PackagesView extends StatelessWidget {
  final PackagesStore _store = PackagesStore();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.072),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderViews(),
          Container(
            height: size.width * 0.17,
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 150),
                    totalRepeatCount: 1,
                    text: [
                      'PAGES.CREATE_ACCOUNT.PACKAGES.HEADER'.tr(),
                    ],
                    isRepeatingAnimation: false,
                    textStyle: TextStyle(
                      fontSize: 15.0,
                      color: whiteColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          PackagesList(_store),
        ],
      ),
    );
  }
}
