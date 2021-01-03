import 'package:flutter/material.dart';
import 'package:fyp/screens/articles_screen.dart';
import 'package:fyp/screens/sideNav/side_drawer.dart';
import 'package:fyp/screens/logIn_and_signup/main_screen.dart';
import 'package:fyp/screens/report_screen.dart';
import 'package:fyp/screens/reported_disaster_screen.dart';
import 'package:fyp/screens/forgotpassword.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInScreen(),
      initialRoute: LogInScreen.id,
      routes: {
        LogInScreen.id: (context) => LogInScreen(),
        /*RegisterScreen.id: (context) => RegisterScreen(),*/
        ForgotPassword.id: (context) => ForgotPassword(),
        ReportedDisasterScreen.id: (context) => ReportedDisasterScreen(),
        DrawerScreen.id: (context) => DrawerScreen(),
        ReportScreen.id: (context) => ReportScreen(),
        ArticlesScreen.id: (context) => ArticlesScreen(),
      },
    );
  }
}
