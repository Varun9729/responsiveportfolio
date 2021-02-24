import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'dart:io' show Platform;
import 'package:universal_platform/universal_platform.dart';

import 'colours.dart';

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameWidget = "Kashyap\nVarun."
        .text
        .white
        .xl6
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
                  CustomAppBar().shimmer(primaryColor: Colours.accentColor),
                  30.heightBox,
                  nameWidget,
                  20.heightBox,
                  VxBox()
                      .color(Colours.accentColor)
                      .size(60, 10)
                      .make()
                      .px4()
                      .shimmer(primaryColor: Colours.accentColor),
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
                ),
              ],
            ).w(context.screenWidth)
          ],
        )
      ]))
          .size(context.screenWidth, context.percentHeight * 68)
          .color(Colours.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        [
          " - Introduction".text.gray500.widest.medium.center.make(),
          10.heightBox,
          "I am currently pursuing my Master's in Computer Science.\nAspiring Flutter Developer.\nInterning at State Department of Healthcare and Family Services."
              .text
              .white
              .xl3
              .maxLines(5)
              .make()
              .w(context.isMobile
                  ? context.screenWidth
                  : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
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
      color: Colours.accentColor,
    );
  }
}

class PictureWidget extends StatelessWidget {
  const PictureWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget detectOS() {
      if (UniversalPlatform.isAndroid) {
        return Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.82,
          height: MediaQuery.of(context).size.height * 0.58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/pic.jpg")),

            // child: Image.asset("assets/pic.jpg",
          ),
        );
      } else if (UniversalPlatform.isIOS) {
        return Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.82,
          height: MediaQuery.of(context).size.height * 0.58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/pic.jpg")),

            // child: Image.asset("assets/pic.jpg",
          ),
        );
      } else if (UniversalPlatform.isWeb) {
        return
            //Container(
            //   alignment: Alignment.center,
            //   width: MediaQuery.of(context).size.width * 0.82,
            //   height: MediaQuery.of(context).size.height * 0.58,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20.0),
            //     image: DecorationImage(
            //         fit: BoxFit.fill, image: AssetImage("assets/pic.jpg")),

            //     // child: Image.asset("assets/pic.jpg",
            //   ),
            // );
            ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            "assets/pic.jpg",
            fit: BoxFit.cover,
            height: context.percentHeight * 60,
          ),
        );
      }
    }

    return Transform(
      alignment: Alignment.center,
      origin: Offset(context.percentWidth * 4, 0),
      transform: Matrix4.rotationY(pi),
      child: detectOS(),
    );
  }
}

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        AntDesign.linkedin_square,
        color: Colors.white,
      ).mdClick(() {
        launch("https://www.linkedin.com/in/kashyapvarun9729/");
      }).make(),
      20.widthBox,
      Icon(
        AntDesign.github,
        color: Colors.white,
      ).mdClick(() {
        launch("https://github.com/Varun9729");
      }).make(),
    ].hStack();
  }
}
