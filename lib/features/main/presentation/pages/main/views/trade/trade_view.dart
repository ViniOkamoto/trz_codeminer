import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/main/presentation/pages/main/views/trade/widgets/list_tile.dart';
import 'package:trzapp/features/main/presentation/stores/main/views/contact/contact_store.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_button.dart';
import 'package:trzapp/features/shared/presentation/widgets/modal_base.dart';

class TradeView extends StatefulWidget {
  @override
  _TradeViewState createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  final UserStore _userStore = serviceLocator<UserStore>();
  final ContactStore _contactStore = ContactStore();

  @override
  Widget build(BuildContext context) {
    _contactStore.getAllContacts();
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
                  Expanded(
                    child: Container(
                      child: Text(
                        "PAGES.MAIN.TRADE.HEADER".tr(),
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: size.width * FONT_SIZE_14),
                      ),
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (context) {
                  return Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: constraints.maxHeight * 0.06),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _contactStore.listUsers.length,
                        itemBuilder: (context, index) {
                          User contact = _contactStore.listUsers[index];
                          return TradeTile(
                            contact: contact,
                            store: _contactStore,
                            userStore: _userStore,
                            constraints: constraints,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (context) => ModalBase(
                                  widgets: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: constraints.maxHeight *
                                                      0.03,
                                                  bottom:
                                                      constraints.maxHeight *
                                                          0.03),
                                              child: Text(
                                                "PAGES.MAIN.TRADE.NEGOTIATE.NEGOTIATE_WITH"
                                                    .tr(args: [contact.name]),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/images/friends_agreeing.png",
                                              width: constraints.maxWidth * 0.5,
                                              height:
                                                  constraints.maxWidth * 0.4,
                                              fit: BoxFit.fill,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "PAGES.MAIN.TRADE.NEGOTIATE.MY_INVENTORY"
                                                            .tr(),
                                                        style: TextStyle(
                                                          fontSize: size.width *
                                                              FONT_SIZE_10,
                                                        ),
                                                      ),
                                                      BuildItem(
                                                        constraints:
                                                            constraints,
                                                        size: size,
                                                        image: Image.asset(
                                                          "assets/images/campbell.png",
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.07,
                                                        ),
                                                      ),
                                                      BuildItem(
                                                        constraints:
                                                            constraints,
                                                        size: size,
                                                        image: Image.asset(
                                                          "assets/images/fiji_water.png",
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.04,
                                                        ),
                                                        padding: 0.085,
                                                      ),
                                                      BuildItem(
                                                        constraints:
                                                            constraints,
                                                        size: size,
                                                        image: Image.asset(
                                                          "assets/images/ak.png",
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.12,
                                                          height: constraints
                                                                  .maxWidth *
                                                              0.05,
                                                          fit: BoxFit.fill,
                                                        ),
                                                        padding: 0.00,
                                                      ),
                                                      BuildItem(
                                                        constraints:
                                                            constraints,
                                                        size: size,
                                                        image: Image.asset(
                                                          "assets/images/medkit.png",
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.07,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          "PAGES.MAIN.TRADE.NEGOTIATE.INVENTORY_OF"
                                                              .tr(args: [
                                                            contact.name
                                                          ]),
                                                          style: TextStyle(
                                                            fontSize: size
                                                                    .width *
                                                                FONT_SIZE_10,
                                                          ),
                                                        ),
                                                      ),
                                                      BuildItem(
                                                        constraints:
                                                            constraints,
                                                        size: size,
                                                        image: Image.asset(
                                                          "assets/images/campbell.png",
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.07,
                                                        ),
                                                      ),
                                                      BuildItem(
                                                        constraints:
                                                            constraints,
                                                        size: size,
                                                        image: Image.asset(
                                                          "assets/images/fiji_water.png",
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.04,
                                                        ),
                                                        padding: 0.085,
                                                      ),
                                                      BuildItem(
                                                        constraints:
                                                            constraints,
                                                        size: size,
                                                        image: Image.asset(
                                                          "assets/images/ak.png",
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.12,
                                                          height: constraints
                                                                  .maxWidth *
                                                              0.05,
                                                          fit: BoxFit.fill,
                                                        ),
                                                        padding: 0.00,
                                                      ),
                                                      BuildItem(
                                                        constraints:
                                                            constraints,
                                                        size: size,
                                                        image: Image.asset(
                                                          "assets/images/medkit.png",
                                                          width: constraints
                                                                  .maxWidth *
                                                              0.07,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: constraints.maxHeight *
                                                      0.03),
                                              width: constraints.maxWidth * 0.5,
                                              child: AppButton(
                                                onPressed: () {},
                                                text:
                                                    "PAGES.MAIN.TRADE.NEGOTIATE.NEGOTIATE"
                                                        .tr(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ).then(
                                (value) {
                                  if (value != "OK" &&
                                      value != null &&
                                      value != false)
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        elevation: 1,
                                        content: Text("$value".tr()),
                                      ),
                                    );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  Widget BuildItem(
      {Widget image,
      String quantities = "0",
      BoxConstraints constraints,
      Size size,
      double padding = 0.06}) {
    quantities = quantities ?? "0";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image,
        Padding(
          padding: EdgeInsets.only(left: constraints.maxWidth * padding),
          child: Text(
            "$quantities",
            style: TextStyle(fontSize: size.width * FONT_SIZE_12),
          ),
        )
      ],
    );
  }
}
