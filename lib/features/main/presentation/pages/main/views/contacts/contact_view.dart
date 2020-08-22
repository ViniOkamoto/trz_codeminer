import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/main/presentation/pages/main/views/contacts/widgets/add_body.dart';
import 'package:trzapp/features/main/presentation/pages/main/views/contacts/widgets/contact_tile.dart';
import 'package:trzapp/features/main/presentation/stores/main/views/contact/contact_store.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';
import 'package:trzapp/features/shared/presentation/widgets/modal_base.dart';

class ContactView extends StatefulWidget {
  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final UserStore _userStore = serviceLocator<UserStore>();
  final ContactStore _store = ContactStore();

  @override
  Widget build(BuildContext context) {
    _store.getAllContacts();
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
                    "PAGES.MAIN.CONTACT.HEADER".tr(),
                    style: TextStyle(
                        color: whiteColor, fontSize: size.width * FONT_SIZE_14),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ModalBase(
                          widgets: AddBody(
                              constraints: constraints,
                              userStore: _userStore,
                              store: _store),
                        ),
                      );
                    },
                    iconSize: constraints.maxWidth * 0.01,
                    icon: Image.asset(
                      "assets/images/icons/add_pixel.png",
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (context) {
                  return Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: constraints.maxHeight * 0.02),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _store.listUsers.length,
                        itemBuilder: (context, index) {
                          User contact = _store.listUsers[index];
                          return ContactTile(
                            contact: contact,
                            store: _store,
                            userStore: _userStore,
                            constraints: constraints,
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
}
