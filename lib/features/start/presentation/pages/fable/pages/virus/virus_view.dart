import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/features/start/presentation/stores/fable/fable_store.dart';

class VirusView extends StatefulWidget {
  const VirusView({
    Key key,
  }) : super(key: key);

  @override
  _VirusViewState createState() => _VirusViewState();
}

class _VirusViewState extends State<VirusView> with TickerProviderStateMixin {
  Animation<double> _fadeInWorld;
  AnimationController animationWorld;

  @override
  void initState() {
    animationWorld = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInWorld = Tween<double>(begin: 0.0, end: 1).animate(animationWorld);
    Future.delayed(Duration(seconds: 6)).then((value) {
      animationWorld.forward();
      _fableStore.buttonIsValid = true;
    });
    super.initState();
  }

  final FableStore _fableStore = serviceLocator<FableStore>();
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
                  speed: Duration(milliseconds: 100),
                  totalRepeatCount: 1,
                  text: ['PAGES.FABLE.VIRUS.HEADER'.tr()],
                  isRepeatingAnimation: false,
                  onFinished: () {
                    _fableStore.firstTextFinished = true;
                  },
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    color: primaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
            Observer(
              builder: (_) {
                if (_fableStore.firstTextFinished)
                  return Padding(
                    padding: EdgeInsets.only(top: size.height * 0.04),
                    child: SizedBox(
                      child: TypewriterAnimatedTextKit(
                          speed: Duration(milliseconds: 50),
                          totalRepeatCount: 1,
                          isRepeatingAnimation: false,
                          text: [
                            'PAGES.FABLE.VIRUS.HISTORY'.tr(),
                          ],
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            color: whiteColor,
                          ),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional
                              .topStart // or Alignment.topLeft
                          ),
                    ),
                  );
                return Container();
              },
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Center(
              child: FadeTransition(
                opacity: _fadeInWorld,
                child: Image.asset(
                  'assets/gifs/horde_tweeteds.gif',
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
    animationWorld.dispose();
    super.dispose();
  }
}
