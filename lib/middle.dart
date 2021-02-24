import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

class MiddleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Vx.blue700,
      child: Flex(
          direction: context.isMobile ? Axis.vertical : Axis.horizontal,
          children: [
            "My Projects\n"
                .richText
                .yellow400
                // .withTextSpanChildren(
                //     ["Selected projects.".textSpan.yellow400.make()])
                .xl4
                .white
                .make(),
            20.widthBox,
            Expanded(
                child: VxSwiper(
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              items: [
                ProjectWidget(title: "Gif-Search",URL: "https://github.com/vipinkashyap/SPA/tree/master/gridview"),
                ProjectWidget(title: "Todoey",URL: "https://github.com/Varun9729/todoey-flutter"),
                ProjectWidget(title: "BMI Calculator",URL: "https://github.com/Varun9729/bmi-calculator-flutter"),
                ProjectWidget(title: "Clima",URL: "https://github.com/Varun9729/Clima-Flutter"),
                ProjectWidget(title: "Flash-Chat",URL: "https://github.com/Varun9729/flash-chat-flutter"),
                ProjectWidget(title: "Interstate Airlines",URL: "https://github.com/Varun9729/Interstate-Airlines"),
                ProjectWidget(title: "Restaurant",URL: "https://github.com/Varun9729/Restaurant"),
                ProjectWidget(title: "Cricket",URL: "https://github.com/Varun9729/Cricket"),
                ProjectWidget(title: "Aptitude Test",URL: "https://github.com/Varun9729/Aptitude-Test"),
                ProjectWidget(title: "Movie Recommender System",URL: "https://github.com/Varun9729/Movie-Recommender-System"),
                ProjectWidget(title: "Time Table",URL: "https://github.com/Varun9729/Time-Table"),
                ProjectWidget(title: "Decentralized Crowdfunding",URL: "https://github.com/Rupii/crowdBC"),
                ProjectWidget(title: "Space Shooter",URL: "https://github.com/Varun9729/Space-Shooter"),
              ],
              height: 500,
              viewportFraction: context.isMobile ? 0.75 : 0.4,
              autoPlay: true,
              autoPlayAnimationDuration: 1.seconds,
            ))
          ]).p32().h(context.isMobile ? 700 : 300),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final String title;
  final String URL;

  const ProjectWidget({Key key, @required this.title, @required this.URL});
  _launchURL([URL = "https://flutter.dev"]) async {
  if (await canLaunch(URL)) {
    await launch(URL);
  } else {
    throw 'Could not launch $URL';
  }
}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: title.text.bold.white.medium.wide.center
            .make()
            .box
            .p4
            .roundedLg
            .neumorphic(color: Vx.blue700, elevation: 5, curve: VxCurve.flat)
            .alignCenter
            .make()
            .p16(),
        onTap: () {
          
          _launchURL(URL);
        });
  }
}


