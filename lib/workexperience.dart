import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class WorkExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
        // backgroundColor: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: ListView(

            shrinkWrap: true,
            children: [
              "Experience".richText.white.xl4.white.make(),
              
              ExperienceTimelineTile(true,false,Icons.analytics_outlined,ExperienceData(
              title: "Business Operations Analyst Intern",
              description:
                  "Currently working at the Illinois State Department of Healthcare and Family Services contributing to the design and definition of basic databases, access methods,validation checks, and statistical methods ",
              workPeriod: "Oct,2019 - Present",
            ),),
              ExperienceTimelineTile(
                false,
                false,
               Icons.code,
                ExperienceData(
                  title: "Application Development Associate",
                  description:
                      "Worked at Accenture Solutions Private Limited developing utility functions to support Tap-to-Pay feature towards a payment module(s). ",
                  workPeriod: "May,2019 to Aug,2019",
                ),
              ),
              ExperienceTimelineTile(false, true,Icons.data_usage,ExperienceData(
              title:
                  "Business Analyst Intern",
              description: "Interned at Pixelvide Private Limited curating the pension databases for the Telangana and Andhra Pradesh governments,helping with sanity testing and Quality Assurance.",
              workPeriod: "May,2018 - July,2018",       
            ),),
            ],
          ),
        ),
      );
  }
}

Widget ExperienceTimelineTile(
    [bool isFirst = false,
    bool isLast = false,
    final IconData iconData = FontAwesomeIcons.laptop,
    Widget ExData = const ExperienceData(
      title: "Business Operations Analyst Intern",
      description:
          "Currently working at the Illinois State Department of Healthcare and Family Services contributing to the design and definition of basic databases, access methods,validation checks, and statistical methods ",
      workPeriod: "Oct,2019 - Present",
    )]) {
  return TimelineTile(
    lineXY: 0.14,
    indicatorStyle: IndicatorStyle(
      color: Colors.black,
      width: 60.0,
      height: 200.0,
      iconStyle: IconStyle(iconData: iconData, fontSize: 40.0,color: Colors.white),
    ),
    isFirst: isFirst,
    isLast: isLast,
    endChild: ExData,
    alignment: TimelineAlign.manual,
    beforeLineStyle: LineStyle(color: Colors.orange),
    afterLineStyle: LineStyle(color: Colors.blue),
  );
}


class ExperienceData extends StatelessWidget {
  final String title;
  final String description;
  final String workPeriod;

  const ExperienceData(
      {@required this.title,
      @required this.description,
      @required this.workPeriod});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                workPeriod,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
