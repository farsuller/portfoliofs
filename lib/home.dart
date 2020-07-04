import 'package:flutter/material.dart';
import 'package:portfoliofs/colors.dart';
import 'package:portfoliofs/footer.dart';
import 'package:portfoliofs/middle.dart';
import 'package:velocity_x/velocity_x.dart';

import 'header.dart';
import 'middlelower.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.primaryColor,
      child: VStack([
        HeaderScreen(),
        if (context.isMobile) IntroductionWidget().p16(),
        MiddleScreen(),
        MiddleLower(),
        FooterScreen(),
      ]).scrollVertical(),
    );
  }
}
