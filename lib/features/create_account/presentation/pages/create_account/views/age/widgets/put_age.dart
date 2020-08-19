import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/stores/age/age_store.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_input.dart';

class PutAge extends StatelessWidget {
  const PutAge({
    Key key,
    @required AgeStore store,
    @required this.size,
  })  : _store = store,
        super(key: key);

  final AgeStore _store;
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
                    controller: _store.nameController,
                    hintText: "PAGES.CREATE_ACCOUNT.AGE.HINT".tr(),
                    onChanged: _store.setAge,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              _store.errorText != null
                  ? Text(
                      _store.errorText.tr(),
                      style: TextStyle(color: Colors.red, fontSize: 12),
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
