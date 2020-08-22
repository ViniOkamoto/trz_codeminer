import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/start/presentation/stores/fable/fable_store.dart';

class SurviveView extends StatefulWidget {
  const SurviveView({
    Key key,
  }) : super(key: key);

  @override
  _SurviveViewState createState() => _SurviveViewState();
}

class _SurviveViewState extends State<SurviveView>
    with TickerProviderStateMixin {
  Animation<double> _fadeInAttack;
  AnimationController animationAttack;

  @override
  void initState() {
    animationAttack = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInAttack = Tween<double>(begin: 0.0, end: 1).animate(animationAttack);
    Future.delayed(Duration(seconds: 7)).then((value) {
      animationAttack.forward();
      _fableStore.buttonIsValid = true;
    });
    super.initState();
  }

  final FableStore _fableStore = serviceLocator<FableStore>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.072),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.12,
                ),
                SizedBox(
                  width: size.width,
                  child: TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 100),
                      totalRepeatCount: 1,
                      text: ['PAGES.FABLE.SURVIVE.HEADER'.tr()],
                      isRepeatingAnimation: false,
                      onFinished: () {
                        _fableStore.firstTextFinished = true;
                      },
                      textStyle: TextStyle(
                        fontSize: size.width * FONT_SIZE_18,
                        fontWeight: FontWeight.w800,
                        color: whiteColor,
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
                                'PAGES.FABLE.SURVIVE.HISTORY'.tr(),
                              ],
                              textStyle: TextStyle(
                                fontSize: size.width * FONT_SIZE_18,
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
                  height: size.height * 0.2,
                ),
              ],
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeInAttack,
              child: Image.asset(
                'assets/images/tweet_attack.png',
                fit: BoxFit.fill,
                width: size.width,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationAttack.dispose();
    super.dispose();
  }
}
