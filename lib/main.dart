import 'package:flutter/material.dart';
import 'package:fyp/screens/articles/articleDisplay.dart';
import 'package:fyp/screens/articles/articleList.dart';
import 'package:fyp/screens/articles/articles_screen.dart';
import 'package:fyp/screens/forgotpassword/forgotpassword.dart';
import 'package:fyp/screens/profile/profile.dart';
import 'package:fyp/screens/report/report_screen.dart';
import 'package:fyp/screens/reported_disasters/reported_disaster_screen.dart';
import 'package:fyp/screens/sideNav/side_drawer.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:fyp/screens/splash/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Body(),
      initialRoute: Body.id,
      routes: {
        Body.id: (context) => Body(),
        /*RegisterScreen.id: (context) => RegisterScreen(),*/
        ForgotPassword.id: (context) => ForgotPassword(),
        ReportedDisasterScreen.id: (context) => ReportedDisasterScreen(),
        DrawerScreen.id: (context) => DrawerScreen(),
        ReportScreen.id: (context) => ReportScreen(),
        ArticlesScreen.id: (context) => ArticlesScreen(),
        ArticleList.id: (context) => ArticleList(),
        Display.id: (context) => Display(),
        ProfileScreen.id: (context) => ProfileScreen(),
        Splash.id: (context) => Splash(),
      },
    );
  }
}
