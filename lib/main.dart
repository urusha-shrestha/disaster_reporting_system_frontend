import 'package:flutter/material.dart';
import 'package:fyp/components/menu_bar.dart';
import 'package:fyp/screens/logIn_screen.dart';
import 'package:fyp/screens/register_screen.dart';
import 'package:fyp/screens/reported_disaster_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String appBarTitle;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInScreen(),
      initialRoute: LogInScreen.id,
      routes: {
        LogInScreen.id: (context) => LogInScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ReportedDisasterScreen.id: (context) => ReportedDisasterScreen(),
        CustomMenuBar.id: (context) => CustomMenuBar(),
      },
    );
  }
}
