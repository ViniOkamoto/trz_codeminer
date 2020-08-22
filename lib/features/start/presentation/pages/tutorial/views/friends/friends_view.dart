import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/core/values/colors.dart';
import 'package:trzapp/core/values/constants.dart';
import 'package:trzapp/features/start/presentation/stores/tutorial/tutorial_store.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({
    Key key,
  }) : super(key: key);

  @override
  _FriendsViewState createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView>
    with TickerProviderStateMixin {
  Animation<double> _fadeInFriends;
  AnimationController animationFriends;
  final TutorialStore _tutorialStore = serviceLocator<TutorialStore>();

  @override
  void initState() {
    animationFriends = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFriends =
        Tween<double>(begin: 0.0, end: 1).animate(animationFriends);
    Future.delayed(Duration(milliseconds: 4000)).then((value) {
      animationFriends.forward();
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
                  speed: Duration(milliseconds: 100),
                  totalRepeatCount: 1,
                  text: [
                    'PAGES.TUTORIAL.ADD_FRIENDS'.tr(),
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
                opacity: _fadeInFriends,
                child: Image.asset(
                  'assets/images/friends_meeting.png',
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
    animationFriends.dispose();
    super.dispose();
  }
}
