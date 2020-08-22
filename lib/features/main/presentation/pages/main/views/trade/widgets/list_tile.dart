import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/main/presentation/stores/main/views/contact/contact_store.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';

class TradeTile extends StatelessWidget {
  const TradeTile({
    Key key,
    @required this.contact,
    @required ContactStore store,
    @required UserStore userStore,
    @required this.constraints,
    this.onTap,
  })  : _store = store,
        _userStore = userStore,
        super(key: key);

  final User contact;
  final ContactStore _store;
  final UserStore _userStore;
  final BoxConstraints constraints;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: constraints.maxWidth * 0.1),
      margin: EdgeInsets.only(bottom: constraints.maxHeight * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/widgets/list_bar.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.01,
                  bottom: constraints.maxHeight * 0.02,
                ),
                child: Image.asset(
                  contact.gender == "M"
                      ? "assets/images/boy_face_pixel.png"
                      : "assets/images/girl_face_pixel.png",
                  width: constraints.maxWidth * 0.15,
                  height: constraints.maxWidth * 0.15,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${contact.name}",
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: size.width * FONT_SIZE_14),
                    ),
                    Text(
                      "PAGES.MAIN.CONTACT.AGE"
                          .tr(args: [contact.age.toString()]),
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: size.width * FONT_SIZE_14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  contact.gender == "M"
                      ? "assets/images/bag_male.png"
                      : "assets/images/bag_female.png",
                  width: constraints.maxWidth * 0.15,
                  height: constraints.maxWidth * 0.1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
