import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/values/colors.dart';

class PackageCard extends StatelessWidget {
  final constraints;
  final String imageCard;
  final String text;
  final String fijiWater;
  final String campBell;
  final String medkit;
  final String ak;
  final int index;
  final int selectedIndex;
  final Function onTap;

  const PackageCard({
    this.constraints,
    this.imageCard,
    this.text,
    this.fijiWater,
    this.campBell,
    this.medkit,
    this.ak,
    this.index = 0,
    this.selectedIndex = 0,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: constraints.maxHeight * 0.1,
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: constraints.maxWidth * 0.15),
                  width: constraints.maxWidth * 0.9,
                  height: constraints.maxWidth * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/widgets/modal.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: constraints.maxHeight * 0.04),
                        child: Text(
                          text.tr(),
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: constraints.maxHeight * 0.04,
                            left: constraints.maxWidth * 0.02,
                            right: constraints.maxWidth * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/fiji_water.png",
                                  width: constraints.maxWidth * 0.15,
                                  height: constraints.maxWidth * 0.15,
                                ),
                                Text(
                                  fijiWater,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/campbell.png",
                                  width: constraints.maxWidth * 0.15,
                                  height: constraints.maxWidth * 0.15,
                                ),
                                Text(
                                  campBell,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/medkit.png",
                                  width: constraints.maxWidth * 0.11,
                                  height: constraints.maxWidth * 0.15,
                                ),
                                Text(
                                  medkit,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/ak.png",
                                  width: constraints.maxWidth * 0.2,
                                  height: constraints.maxWidth * 0.15,
                                ),
                                Text(
                                  ak,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                imageCard,
                width: constraints.maxWidth * 0.2,
                height: constraints.maxWidth * 0.26,
                fit: BoxFit.fill,
              ),
            ),
            index == selectedIndex
                ? Positioned(
                    top: constraints.maxWidth * 0.15,
                    right: 0,
                    child: Image.asset(
                      "assets/images/icons/done.png",
                      width: constraints.maxWidth * 0.12,
                      height: constraints.maxWidth * 0.1,
                      fit: BoxFit.fill,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
