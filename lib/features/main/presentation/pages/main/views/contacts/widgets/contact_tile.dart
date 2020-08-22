import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/main/presentation/stores/main/views/contact/contact_store.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_button.dart';
import 'package:trzapp/features/shared/presentation/widgets/modal_base.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key key,
    @required this.contact,
    @required ContactStore store,
    @required UserStore userStore,
    @required this.constraints,
  })  : _store = store,
        _userStore = userStore,
        super(key: key);

  final User contact;
  final ContactStore _store;
  final UserStore _userStore;
  final BoxConstraints constraints;

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
                                Image.asset(
                                  "assets/images/report_tweets.png",
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: constraints.maxHeight * 0.03,
                                      bottom: constraints.maxHeight * 0.03),
                                  child: Text(
                                    "PAGES.MAIN.CONTACT.REPORT.DESCRIPTION"
                                        .tr(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                        },
                                        text: "COMMON.NO".tr(),
                                      ),
                                    ),
                                    Expanded(
                                      child: AppButton(
                                        onPressed: () async {
                                          var result = await _store.reportUser(
                                            _userStore.id,
                                            contact.id,
                                          );
                                          Navigator.pop(context, result);
                                        },
                                        text: "COMMON.YES".tr(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ).then(
                    (value) {
                      if (value != "OK" && value != false && value != null)
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
                child: Image.asset(
                  "assets/images/icons/report_pixel.png",
                  width: constraints.maxWidth * 0.1,
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
