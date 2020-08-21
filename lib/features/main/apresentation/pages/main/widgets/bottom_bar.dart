import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/features/main/apresentation/stores/main/main_store.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    @required this.size,
    @required MainStore homeStore,
    @required UserStore userStore,
  })  : _homeStore = homeStore,
        _userStore = userStore,
        super(key: key);

  final Size size;
  final MainStore _homeStore;
  final UserStore _userStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: size.height * 0.1, left: size.width * 0.01),
      child: Observer(
        builder: (context) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      _homeStore.setInventoryIsOpen();
                    },
                    child: Image.asset(
                      _homeStore.inventoryIsOpen
                          ? "assets/images/bag_male_open.png"
                          : "assets/images/bag_male.png",
                      width: size.width * 0.15,
                      height: size.width * 0.14,
                    ),
                  ),
                ],
              ),
              !_homeStore.inventoryIsOpen
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(),
                      ],
                    )
                  : Expanded(
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: constraints.maxWidth * 0.05,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pontos: ${_userStore.points}",
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 12,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: constraints.maxWidth * 0.95,
                                      height: constraints.maxWidth * 0.15,
                                      padding: EdgeInsets.only(
                                        left: constraints.maxWidth * 0.05,
                                        top: constraints.maxHeight * 0.01,
                                        bottom: constraints.maxHeight * 0.02,
                                        right: constraints.maxWidth * 0.1,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/widgets/inventory_bar.png",
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/fiji_water.png",
                                                width:
                                                    constraints.maxWidth * 0.05,
                                                height:
                                                    constraints.maxWidth * 0.08,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: constraints.maxWidth *
                                                        0.02),
                                                child: Text(
                                                  "${_userStore.fiji}",
                                                  style: TextStyle(
                                                    color: whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/campbell.png",
                                                width:
                                                    constraints.maxWidth * 0.05,
                                                height:
                                                    constraints.maxWidth * 0.08,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: constraints.maxWidth *
                                                        0.02),
                                                child: Text(
                                                  "${_userStore.camp}",
                                                  style: TextStyle(
                                                    color: whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/medkit.png",
                                                width:
                                                    constraints.maxWidth * 0.09,
                                                height:
                                                    constraints.maxWidth * 0.08,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: constraints.maxWidth *
                                                        0.02),
                                                child: Text(
                                                  "${_userStore.medkit}",
                                                  style: TextStyle(
                                                    color: whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/ak.png",
                                                width:
                                                    constraints.maxWidth * 0.15,
                                                height:
                                                    constraints.maxWidth * 0.08,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: constraints.maxWidth *
                                                        0.02),
                                                child: Text(
                                                  "${_userStore.ak}",
                                                  style: TextStyle(
                                                    color: whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
