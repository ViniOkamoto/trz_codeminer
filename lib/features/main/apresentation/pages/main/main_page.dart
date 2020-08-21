import 'package:flutter/material.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/main/apresentation/pages/main/views/contacts/contact_view.dart';
import 'package:trzapp/features/main/apresentation/pages/main/views/reports/reports_view.dart';
import 'package:trzapp/features/main/apresentation/pages/main/views/trade/trade_view.dart';
import 'package:trzapp/features/main/apresentation/pages/main/widgets/bottom_bar.dart';
import 'package:trzapp/features/main/apresentation/pages/main/widgets/menu_bar.dart';
import 'package:trzapp/features/main/apresentation/stores/main/main_store.dart';
import 'package:trzapp/features/shared/presentation/stores/user_store.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final UserStore _userStore = serviceLocator<UserStore>();
  final MainStore _mainStore = MainStore();

  List<Widget> _pages = [
    ReportsView(),
    TradeView(),
    ContactView(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          "assets/gifs/background.gif",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuBar(
                      size: size,
                      mainStore: _mainStore,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          right: size.width * 0.08,
                        ),
                        child: PageView(
                          controller: _mainStore.pageController,
                          children: _pages,
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomBar(
              size: size, homeStore: _mainStore, userStore: _userStore),
        ),
      ],
    );
  }
}
