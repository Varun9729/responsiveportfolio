import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsiveportfolio/colours.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPortfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colours.accentColor,
              primarySwatch: Colors.orange,
              textTheme: GoogleFonts.poppinsTextTheme(),
              visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}


