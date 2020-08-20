import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/features/main/apresentation/pages/home/widgets/bottom_bar.dart';
import 'package:trzapp/features/main/apresentation/pages/home/widgets/menu_bar.dart';
import 'package:trzapp/features/main/apresentation/stores/home/home_store.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserStore _userStore = serviceLocator<UserStore>();
  final HomeStore _homeStore = HomeStore();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuBar(size: size),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.08,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "PAGES.HOME.NAME_USER"
                                .tr(args: [_userStore.user.name]),
                            style: TextStyle(fontSize: 14, color: whiteColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar:
          BottomBar(size: size, homeStore: _homeStore, userStore: _userStore),
    );
  }
}
