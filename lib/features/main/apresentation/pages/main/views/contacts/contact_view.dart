import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/features/main/apresentation/stores/main/views/contact/contact_store.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_button.dart';
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
                    "Lista de contatos",
                    style: TextStyle(color: whiteColor, fontSize: 14),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => ModalBase(
                          widgets: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AppButton(
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          builder: (context) => ModalBase(
                                            widgets: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text("MEU QR CODE"),
                                                    QrImage(
                                                      data:
                                                          '${_userStore.user.toString()}',
                                                      version: QrVersions.auto,
                                                      size: 200.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      text: "Gerar meu QR CODE",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppButton(
                                      onPressed: () async {
                                        String cameraScanResult =
                                            await scanner.scan();
                                        _store.addContact(cameraScanResult);
                                        _store.getAllContacts();
                                        Navigator.pop(context);
                                      },
                                      text: "Escanear QR CODE",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppButton(
                                      onPressed: () {},
                                      text: "Abrir QR CODE",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
              Observer(builder: (context) {
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _store.listUsers.length,
                    itemBuilder: (context, index) {
                      User contact = _store.listUsers[index];
                      return Container(
                        padding:
                            EdgeInsets.only(right: constraints.maxWidth * 0.1),
                        margin: EdgeInsets.only(
                            bottom: constraints.maxHeight * 0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/widgets/list_contact_bar.png",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${contact.name}",
                                        style: TextStyle(
                                            color: whiteColor, fontSize: 14),
                                      ),
                                      Text(
                                        "${contact.age} ANOS",
                                        style: TextStyle(
                                            color: whiteColor, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: constraints.maxWidth * 0.03),
                                  child: GestureDetector(
                                    child: Image.asset(
                                      "assets/images/icons/ask_icon.png",
                                      width: constraints.maxWidth * 0.1,
                                      height: constraints.maxWidth * 0.1,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  child: Image.asset(
                                    "assets/images/icons/report_pixel.png",
                                    width: constraints.maxWidth * 0.1,
                                    height: constraints.maxWidth * 0.1,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              })
            ],
          ),
        );
      },
    );
  }
}
