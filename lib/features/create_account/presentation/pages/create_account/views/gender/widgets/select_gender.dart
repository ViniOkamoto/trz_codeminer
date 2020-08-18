import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/stores/gender/gender_store.dart';

class SelectGender extends StatelessWidget {
  const SelectGender({
    Key key,
    @required this.size,
    @required GenderStore store,
  })  : _store = store,
        super(key: key);

  final Size size;
  final GenderStore _store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                _store.setGender("M");
              },
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/icons/male_icon.png",
                    fit: BoxFit.fill,
                    width: size.width * 0.12,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      _store.gender != null && _store.gender == "M"
                          ? "assets/images/boy_hands_up.png"
                          : "assets/images/boy_tweet.png",
                      width: _store.gender != null && _store.gender == "M"
                          ? size.width * 0.24
                          : size.width * 0.17,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                _store.setGender("F");
              },
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/icons/female_icon.png",
                    fit: BoxFit.fill,
                    width: size.width * 0.12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Image.asset(
                      _store.gender != null && _store.gender == "F"
                          ? "assets/images/girl_hands_up.png"
                          : "assets/images/girl_tweet.png",
                      width: _store.gender != null && _store.gender == "F"
                          ? size.width * 0.25
                          : size.width * 0.215,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
