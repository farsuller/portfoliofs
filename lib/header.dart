import 'dart:math';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfoliofs/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'data/data.dart';

class HeaderScreen extends StatefulWidget {
  @override
  _HeaderScreenState createState() => _HeaderScreenState();
}

class _HeaderScreenState extends State<HeaderScreen> {

  @override
  Widget build(BuildContext context) {
    final nameWidget = "Florence Arnold\nSuller."
        .text
        .white
        .xl2
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer();
    return SafeArea(
      child: VxBox(
              child: VStack([
        ZStack(
          [
            PictureWidget(),
            Row(
              children: [
                VStack([
                  if (context.isMobile) 50.heightBox else 10.heightBox,
                  CustomAppBar().shimmer(primaryColor: Colors.amber),
                  30.heightBox, nameWidget, 10.heightBox,
                  VxBox()
                      .color(Coolors.accentColor)
                      .size(90, 10)
                      .make()
                      .px4()
                      .shimmer(primaryColor: Colors.amber),
                  30.heightBox,
                  SocialAccounts(),
                ]).pSymmetric(
                  h: context.percentWidth * 10,
                  v: 32,
                ),
                Expanded(
                  child: VxResponsive(
                    medium: IntroductionWidget()
                        .pOnly(left: 120)
                        .h(context.percentHeight * 60),
                    large: IntroductionWidget()
                        .pOnly(left: 120)
                        .h(context.percentHeight * 60),
                    fallback: const Offstage(),
                  ),
                )
              ],
            ).w(context.screenWidth)
          ],
        )
      ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolors.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatefulWidget {
  const IntroductionWidget({
    Key key,
  }) : super(key: key);

  @override
  _IntroductionWidgetState createState() => _IntroductionWidgetState();
}

class _IntroductionWidgetState extends State<IntroductionWidget> {

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['Portofolio', 'Info'],
    nonPersonalizedAds: true,
  );

  RewardedVideoAd videoAd = RewardedVideoAd.instance;
  static const _adRewardedUnitID = "ca-app-pub-7246721390383587/7764747360";

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: admobAppID);

    super.initState();
    videoAd.load(
        adUnitId: _adRewardedUnitID,
        targetingInfo: targetingInfo);

    videoAd.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print("REWARDED VIDEO AD $event");
    };
  }
  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          " - Portfolio".text.gray500.widest.sm.make(),
          10.heightBox,
          "I'm a Mobile Application Developer, experienced on development to deployment in Android & iOS."
              "\n"
              "\n My known skills are Java, Kotlin, Objective-C, C# and Flutter."
          "\n"
          "\n I work closely to the Project Manager, experienced in agile project management, had published multiple Apps on PlayStore and AppStore."
              "\nCurrently at work on EMAPTA"
              "\nBut open for other projects"
              .text
              .white
              .xl2
              .maxLines(20)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        RaisedButton(
          onPressed: () {
            videoAd.show();
          },
          hoverColor: Vx.purple700,
          shape: Vx.roundedSm,
          color: Colors.amber,
          textColor: Coolors.primaryColor,
          child: "For Support Click Here".text.make(),
        ).h(50)
      ],
      // crossAlignment: CrossAxisAlignment.center,
      alignment: MainAxisAlignment.spaceEvenly,
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      AntDesign.codesquare,
      size: 50,
      color: Colors.amberAccent,
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      origin: Offset(context.percentWidth * 2, 0),
      transform: Matrix4.rotationY(pi),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 100.0),
        child: Image.asset(
          "assets/renz.png",
          fit: BoxFit.cover,
          height: context.percentHeight * 30,
        ),
      ),
    );
  }
}

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.twitter,
        color: Colors.white,
      ).mdClick(() {
        launch("https://twitter.com/ArnoldSuller");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.instagram,
        color: Colors.white,
      ).mdClick(() {
        launch("https://instagram.com/florenzearnold");
      }).make(),
      20.widthBox,
//      Icon(AntDesign.youtube, color: Colors.white,).mdClick(() {
//        launch("https://youtube.com/mtechviral");
//      }).make(),
//      20.widthBox,
      Icon(
        AntDesign.github,
        color: Colors.white,
      ).mdClick(() {
        launch("https://github.com/farsuller");
      }).make()
    ].hStack();
  }
}
