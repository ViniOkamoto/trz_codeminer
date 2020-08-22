import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/start/presentation/stores/tutorial/tutorial_store.dart';

class WinnerView extends StatefulWidget {
  const WinnerView({
    Key key,
  }) : super(key: key);

  @override
  _WinnerViewState createState() => _WinnerViewState();
}

class _WinnerViewState extends State<WinnerView> with TickerProviderStateMixin {
  Animation<double> _fadeInBoy;
  AnimationController animationBoy;
  final TutorialStore _tutorialStore = serviceLocator<TutorialStore>();

  @override
  void initState() {
    animationBoy = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInBoy = Tween<double>(begin: 0.0, end: 1).animate(animationBoy);
    Future.delayed(Duration(milliseconds: 4000)).then((value) {
      animationBoy.forward();
      _tutorialStore.buttonIsValid = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.072),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.12,
            ),
            SizedBox(
              width: size.width,
              child: TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 70),
                  totalRepeatCount: 1,
                  text: [
                    'PAGES.TUTORIAL.WINNER'.tr(),
                  ],
                  isRepeatingAnimation: false,
                  textStyle: TextStyle(
                    fontSize: size.width * FONT_SIZE_18,
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            Center(
              child: FadeTransition(
                opacity: _fadeInBoy,
                child: Image.asset(
                  'assets/images/winner.png',
                  fit: BoxFit.fill,
                  width: size.width * 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationBoy.dispose();
    super.dispose();
  }
}
