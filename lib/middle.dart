import 'package:flutter/material.dart';
import 'package:portfoliofs/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Coolors.amber2Color,
      child: Flex(
          direction: context.isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            "Mobile Apps,\n"
                .richText
                .withTextSpanChildren(
                    ["Projects and Deployed.".textSpan.yellow100.make()])
                .xl3.white
                .make(),
            20.widthBox,
            Expanded(
                child: VxSwiper(
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              items: [
                ProjectWidget(title: "BetterCleaner"),
                ProjectWidget(title: "BetterCleaner Lite"),
                ProjectWidget(title: "huddle.live"),
                ProjectWidget(title: "Bright Cobrowsing"),
                ProjectWidget(title: "Ocean Sweep"),
                ProjectWidget(title: "PetCare Dog Games"),
                ProjectWidget(title: "Princess Magic Beauty Potion"),
                ProjectWidget(title: "Fun Popping Bubbles"),
                ProjectWidget(title: "Ear Doctor Games"),
                ProjectWidget(title: "Pet Pony Salon"),
                ProjectWidget(title: "Spark Cleaner"),
              ],
              height: 200,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
            ))
          ]).p64().h(context.isMobile ? 500 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;

  const ProjectWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return title.text.bold.white.xl.wide.center
        .make()
        .box
        .p8
        .roundedLg
        .neumorphic(color: Coolors.amberColor, elevation: 5, curve: VxCurve.flat)
        .alignCenter
        .square(200)
        .make()
        .p16();
  }
}
