import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/routes.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/age/age_view.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/gender/gender_view.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/location/location_view.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/name/name_view.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/packages/packages_view.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';
import 'package:trzapp/features/shared/presentation/widgets/app_button.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  CreateAccountStore _store;

  List<Widget> pages = [
    GenderView(),
    NameView(),
    AgeView(),
    LocationView(),
    PackagesView(),
  ];

  @override
  void initState() {
    _store = serviceLocator<CreateAccountStore>();
    _store.indexViews = pages.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackColor,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _store.pageController,
        children: pages,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      onPressed: () async {
                        if (_store.currentPage == 4) {
                          String result = await _store.registerUser();
                          if (result != "OK") {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                elevation: 1,
                                content: Text(result.tr()),
                              ),
                            );
                            return;
                          }
                          Navigator.pushReplacementNamed(
                              context, Routes.tutorial);
                          return;
                        }
                        _store.nextView();
                      },
                      btnIsValid: _store.enabledButton,
                      text: _store.currentPage == 4
                          ? 'PAGES.CREATE_ACCOUNT.BUTTON_REGISTER'.tr()
                          : 'COMMON.BUTTON_CONTINUE'.tr(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
