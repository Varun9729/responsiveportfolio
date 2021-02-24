import 'package:flutter/material.dart';
import 'package:responsiveportfolio/workexperience.dart';
import 'colours.dart';
import 'package:velocity_x/velocity_x.dart';
import 'middle.dart';

import 'header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colours.primaryColor,
      child: VStack([
        HeaderScreen(),
        if (context.isMobile) IntroductionWidget().p16(),
        MiddleScreen(),
        WorkExperienceScreen(),
        
      ]).scrollVertical(),
    );
  }
}