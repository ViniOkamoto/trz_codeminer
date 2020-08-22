import 'package:flutter/material.dart';
import 'package:trzapp/features/main/presentation/stores/main/main_store.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({
    Key key,
    @required this.size,
    @required this.mainStore,
  }) : super(key: key);

  final Size size;
  final MainStore mainStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width * 0.2,
          height: size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                "assets/images/widgets/menu_bar_pixel.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: IconButton(
                  onPressed: () {
                    mainStore.selectView(0);
                  },
                  iconSize: size.width * 0.1,
                  icon: Image.asset(
                    "assets/images/icons/house.png",
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  mainStore.selectView(1);
                },
                iconSize: size.width * 0.1,
                icon: Image.asset(
                  "assets/images/icons/exchange.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: IconButton(
                  onPressed: () {
                    mainStore.selectView(2);
                  },
                  iconSize: size.width * 0.1,
                  icon: Image.asset(
                    "assets/images/icons/list_contact_pixel.png",
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
