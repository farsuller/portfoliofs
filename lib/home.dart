
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:portfoliofs/colors.dart';
import 'package:portfoliofs/footer.dart';
import 'package:portfoliofs/middle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'header.dart';
import 'middlelower.dart';

class HomeScreen extends StatefulWidget {

  // _adunitID id TEST ID
  static const _adTestUnitID = "ca-app-pub-3940256099942544/8135179316";
  static const _adNativeUnitID = "ca-app-pub-7246721390383587/6590717757";
  static const _adBannerUnitID = "ca-app-pub-7246721390383587/6946489713";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _nativeAdController = NativeAdmobController();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.primaryColor,
      child: VStack([
        HeaderScreen(),
        if (context.isMobile) IntroductionWidget().p16(),
        adsNativeContainer(),
        MiddleScreen(),
        MiddleLower(),
        adsBannerContainer(),
        FooterScreen(),
      ]).scrollVertical(),
    );
  }

  Widget adsNativeContainer() {
    return Container(
      //You Can Set Container Height
      height: 250,
      color: Colors.white,
      child: NativeAdmob(
        // Your ad unit id
        adUnitID: HomeScreen._adNativeUnitID,
        controller: _nativeAdController,
        type: NativeAdmobType.full,
        error: CupertinoActivityIndicator(),
      ),
    );
  }

  Widget adsBannerContainer() {
    return Container(
      //You Can Set Container Height
      height: 100,
      color: Colors.white,
      child: NativeAdmob(
        // Your ad unit id
        adUnitID: HomeScreen._adNativeUnitID,
        controller: _nativeAdController,
        type: NativeAdmobType.banner,
        error: CupertinoActivityIndicator(),
      ),
    );
  }

}
