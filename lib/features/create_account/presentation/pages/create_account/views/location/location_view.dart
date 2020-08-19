import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/features/create_account/presentation/pages/create_account/views/widgets/header_views.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/stores/location/location_store.dart';

class LocationView extends StatelessWidget {
  final LocationStore _store = LocationStore();
  Location location = new Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  _checkGeolocalizationStatus() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    while (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }

    if (_permissionGranted != PermissionStatus.granted) {
      _store.setBtnValid();
    }

    _locationData = await location.getLocation();
    _store.setLocation(
        longitude: _locationData.longitude, latitude: _locationData.latitude);
    _store.setBtnValid();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.072),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderViews(),
            Container(
              height: size.width * 0.37,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 80),
                      totalRepeatCount: 1,
                      text: [
                        'PAGES.CREATE_ACCOUNT.LOCATION.HEADER'.tr(),
                      ],
                      isRepeatingAnimation: false,
                      onFinished: () {
                        _checkGeolocalizationStatus();
                      },
                      textStyle: TextStyle(
                        fontSize: 15.0,
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Image.asset(
                          "assets/images/localize_us.png",
                          width: constraints.maxWidth * 0.6,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
