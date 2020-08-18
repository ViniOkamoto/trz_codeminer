import 'package:flutter/material.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';

class HeaderViews extends StatelessWidget {
  final CreateAccountStore _store = serviceLocator<CreateAccountStore>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                _store.backPage();
              },
              child: Image.asset(
                "assets/images/icons/arrow_icon.png",
                width: size.width * 0.096,
                height: size.width * 0.085,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: size.height * 0.023,
          ),
          child: Center(
            child: Image.asset(
              "assets/images/trz_logo.png",
              width: size.width * 0.274,
              height: size.width * 0.274,
            ),
          ),
        ),
      ],
    );
  }
}
