import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/main/presentation/stores/main/views/report/report_store.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';

class ReportsView extends StatefulWidget {
  @override
  _ReportsViewState createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  final UserStore _userStore = serviceLocator<UserStore>();
  final ReportStore _reportStore = ReportStore();
  @override
  Widget build(BuildContext context) {
    _reportStore.getInfected();
    _reportStore.getNonInfected();
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: EdgeInsets.only(top: constraints.maxHeight * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PAGES.MAIN.REPORTS.NAME_USER"
                        .tr(args: [_userStore.user.name ?? "ZEZINHO"]),
                    style: TextStyle(
                        color: whiteColor, fontSize: size.width * FONT_SIZE_14),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/widgets/modal.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Observer(builder: (context) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "PAGES.MAIN.REPORTS.HUMANS".tr(),
                                        style: TextStyle(
                                          fontSize: size.width * FONT_SIZE_12,
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/humans.png",
                                        width: constraints.maxWidth * 0.3,
                                        fit: BoxFit.fill,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.01),
                                        child: Text(
                                          "${_reportStore.percentNonInfected}%",
                                          style: TextStyle(
                                            fontSize: size.width * FONT_SIZE_14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "PAGES.MAIN.REPORTS.INFECTEDS".tr(),
                                        style: TextStyle(
                                          fontSize: size.width * FONT_SIZE_12,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/images/twitteds.png",
                                          width: constraints.maxWidth * 0.24,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        "${_reportStore.percentInfected}%",
                                        style: TextStyle(
                                          fontSize: size.width * FONT_SIZE_14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Image.asset(
                            "assets/images/icons/exclamation_icon.png",
                            width: constraints.maxWidth * 0.05,
                            height: constraints.maxWidth * 0.15,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
