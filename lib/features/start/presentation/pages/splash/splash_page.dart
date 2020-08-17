import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/routes.dart';
import 'package:trzapp/features/start/presentation/stores/splash/splash_store.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final SplashStore _store = SplashStore();
  AnimationController animationPresents;
  Animation<double> _fadeInFadeOutPresents;
  Animation<double> _fadeInLogo;
  AnimationController animationLogo;
  @override
  void initState() {
    super.initState();
    animationPresents = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animationLogo = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOutPresents =
        Tween<double>(begin: 0.0, end: 1).animate(animationPresents);
    _fadeInLogo = Tween<double>(begin: 0.0, end: 1).animate(animationLogo);

    Future.delayed(Duration(seconds: 8)).then(
      (value) {
        animationLogo.forward();
        Future.delayed(Duration(seconds: 5)).then(
            (value) => Navigator.pushReplacementNamed(context, Routes.fable));
      },
    );
    animationPresents.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationPresents.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationPresents.forward();
        animationPresents.dispose();
        _store.presentsFinished = true;
      }
    });
    animationPresents.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  child: Center(
                    child: FadeTransition(
                      opacity: _fadeInFadeOutPresents,
                      child: Image.asset(
                        'assets/gifs/present_okacode.gif',
                        fit: BoxFit.fill,
                        width: size.width * 0.5,
                      ),
                    ),
                  ),
                ),
                Observer(
                  builder: (_) {
                    if (_store.presentsFinished) {
                      return FadeTransition(
                        opacity: _fadeInLogo,
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.4,
                              child: Container(
                                width: size.width,
                                height: size.height,
                                child: Image.asset(
                                  'assets/gifs/lighting_splash.gif',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: size.width,
                              height: size.height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: size.height * 0.02),
                                    width: size.width * 0.55,
                                    child: Image.asset(
                                      "assets/gifs/trz_logo.gif",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.5,
                                  ),
                                  Image.asset(
                                    "assets/gifs/loading_tweet.gif",
                                    width: size.width * 0.45,
                                    fit: BoxFit.none,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationLogo.dispose();
    super.dispose();
  }
}
