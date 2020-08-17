import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/features/start/presentation/pages/fable/pages/apocalypse/apocalypse_view.dart';
import 'package:trzapp/features/start/presentation/pages/fable/pages/survive/survive_view.dart';
import 'package:trzapp/features/start/presentation/pages/fable/pages/virus/virus_view.dart';
import 'package:trzapp/features/start/presentation/pages/fable/pages/world/world_view.dart';
import 'package:trzapp/features/start/presentation/stores/fable/fable_store.dart';

class FablePage extends StatefulWidget {
  @override
  _FablePageState createState() => _FablePageState();
}

class _FablePageState extends State<FablePage> {
  FableStore _store;

  List<Widget> pages = [
    WorldView(),
    ApocalypseView(),
    VirusView(),
    SurviveView(),
  ];
  @override
  void initState() {
    _store = serviceLocator<FableStore>();
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
                      _store.nextView();
                    },
                    btnIsValid: _store.enabledButton,
                    text: 'COMMON.BUTTON_CONTINUE'.tr(),
                  ),
                  _store.currentPage != 3
                      ? Padding(
                          padding: EdgeInsets.only(top: size.height * 0.011),
                          child: GestureDetector(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'PAGES.FABLE.SKIP_HISTORY'.tr(),
                                style: TextStyle(
                                    fontSize: 14, color: greyLightColor),
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

class AppButton extends StatelessWidget {
  final Function onPressed;
  final bool btnIsValid;
  final String text;

  const AppButton({
    @required this.btnIsValid,
    @required this.onPressed,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.56,
      height: size.width * 0.13,
      child: RaisedButton(
        onPressed: btnIsValid ? onPressed : null,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: whiteColor)),
        color: primaryColor,
        child: Center(
          child: FittedBox(
            child: Text(
              "$text",
              style: TextStyle(fontSize: 18, color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
