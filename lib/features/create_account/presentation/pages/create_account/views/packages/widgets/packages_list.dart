import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/packages/widgets/package_card.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/stores/packages/packages_store.dart';

class PackagesList extends StatelessWidget {
  final PackagesStore _store;
  PackagesList(this._store);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: Observer(builder: (context) {
              return ListView(
                scrollDirection: Axis.vertical,
                children: [
                  PackageCard(
                    index: 1,
                    selectedIndex: _store.package,
                    onTap: () {
                      _store.setPackages(1);
                    },
                    constraints: constraints,
                    imageCard: "assets/images/boy_ak_47.png",
                    text: "PAGES.CREATE_ACCOUNT.PACKAGES.LIVING_SHOOTING",
                    ak: "6",
                    campBell: "1",
                    fijiWater: "1",
                    medkit: "1",
                  ),
                  PackageCard(
                    index: 2,
                    selectedIndex: _store.package,
                    onTap: () {
                      _store.setPackages(2);
                    },
                    constraints: constraints,
                    imageCard: "assets/images/girl_ambulance.png",
                    text: "PAGES.CREATE_ACCOUNT.PACKAGES.WALKING_AMBULANCE",
                    ak: "1",
                    campBell: "1",
                    fijiWater: "1",
                    medkit: "5",
                  ),
                  PackageCard(
                    index: 3,
                    selectedIndex: _store.package,
                    onTap: () {
                      _store.setPackages(3);
                    },
                    constraints: constraints,
                    imageCard: "assets/images/boy_glutton.png",
                    text: "PAGES.CREATE_ACCOUNT.PACKAGES.GLUTTON",
                    ak: "1",
                    campBell: "4",
                    fijiWater: "2",
                    medkit: "0",
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
