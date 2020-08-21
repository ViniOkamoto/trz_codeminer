import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:trzapp/features/main/apresentation/stores/main/views/contact/contact_store.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_button.dart';
import 'package:trzapp/features/shared/presentation/widgets/modal_base.dart';

class AddBody extends StatelessWidget {
  const AddBody({
    Key key,
    @required UserStore userStore,
    @required ContactStore store,
    @required this.constraints,
  })  : _userStore = userStore,
        _store = store,
        super(key: key);

  final UserStore _userStore;
  final ContactStore _store;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/friends_meeting.png",
          width: MediaQuery.of(context).size.width * 0.3,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: constraints.maxHeight * 0.03,
            bottom: constraints.maxHeight * 0.05,
          ),
          child: Text(
            "PAGES.MAIN.CONTACT.ADD.DESCRIPTION".tr(),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: AppButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) => ModalBase(
                      widgets: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("PAGES.MAIN.CONTACT.ADD.MY_QR".tr()),
                              QrImage(
                                data: '${_userStore.user.toString()}',
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
                text: "PAGES.MAIN.CONTACT.ADD.GENERATE_QR".tr(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: AppButton(
                onPressed: () async {
                  String cameraScanResult = await scanner.scan();
                  _store.addContact(cameraScanResult, _userStore.id);
                  _store.getAllContacts();
                  Navigator.pop(context);
                },
                text: "PAGES.MAIN.CONTACT.ADD.SCAN_QR".tr(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
