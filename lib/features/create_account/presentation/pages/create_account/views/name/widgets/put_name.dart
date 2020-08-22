import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/stores/name/name_store.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_input.dart';

class PutName extends StatelessWidget {
  const PutName({
    Key key,
    @required NameStore store,
    @required this.size,
  })  : _store = store,
        super(key: key);

  final NameStore _store;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (_store.firstTextFinished)
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.04,
                ),
                child: SizedBox(
                  child: AppInput(
                    fontSize: size.width * FONT_SIZE_14,
                    controller: _store.nameController,
                    hintText: "PAGES.CREATE_ACCOUNT.NAME.HINT".tr(),
                    onChanged: _store.setName,
                  ),
                ),
              ),
              _store.errorText != null
                  ? Text(
                      _store.errorText.tr(),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: size.width * FONT_SIZE_12,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Container(),
            ],
          );
        return Container();
      },
    );
  }
}
