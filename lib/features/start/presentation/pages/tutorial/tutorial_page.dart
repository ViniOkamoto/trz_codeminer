import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/core/values/routes.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_button.dart';
import 'package:trzapp/features/start/presentation/pages/tutorial/views/be_careful/be_careful.dart';
import 'package:trzapp/features/start/presentation/pages/tutorial/views/friends/friends_view.dart';
import 'package:trzapp/features/start/presentation/pages/tutorial/views/negotiate/negotiate_view.dart';
import 'package:trzapp/features/start/presentation/pages/tutorial/views/ready/ready_view.dart';
import 'package:trzapp/features/start/presentation/pages/tutorial/views/report/report_view.dart';
import 'package:trzapp/features/start/presentation/pages/tutorial/views/winner/winner_view.dart';
import 'package:trzapp/features/start/presentation/stores/tutorial/tutorial_store.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  TutorialStore _store;

  List<Widget> pages = [
    ReadyView(),
    FriendsView(),
    NegotiateView(),
    BeCarefulView(),
    ReportView(),
    WinnerView(),
  ];
  @override
  void initState() {
    _store = serviceLocator<TutorialStore>();
    _store.indexViews = pages.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackColor,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _store.pageController,
        children: pages,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(
                    onPressed: () {
                      if (_store.currentPage == 5) {
                        Navigator.pushReplacementNamed(context, Routes.main);
                        return;
                      }
                      _store.nextView();
                    },
                    btnIsValid: _store.enabledButton,
                    text: _store.currentPage == 5
                        ? "PAGES.TUTORIAL.LETS_GO".tr()
                        : 'COMMON.BUTTON_CONTINUE'.tr(),
                  ),
                  _store.currentPage != 5
                      ? Padding(
                          padding: EdgeInsets.only(top: size.height * 0.011),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.main);
                            },
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'PAGES.TUTORIAL.SKIP'.tr(),
                                style: TextStyle(
                                    fontSize: size.width * FONT_SIZE_14,
                                    color: greyLightColor),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
