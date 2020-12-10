import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/screens/side_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fyp/screens/side_drawer.dart';
import 'package:fyp/screens/logIn_screen.dart';
import 'package:fyp/screens/register_screen.dart';
import 'package:fyp/screens/report_screen.dart';
import 'package:fyp/screens/reported_disaster_screen.dart';
import 'package:fyp/screens/forgotpassword.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          DrawerScreen(),
          ReportedDisasterScreen(),
        ],
      ),
      initialRoute: ReportedDisasterScreen.id,
      routes: {
        LogInScreen.id: (context) => LogInScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ForgotPassword.id: (context) => ForgotPassword(),
        ReportedDisasterScreen.id: (context) => ReportedDisasterScreen(),
        DrawerScreen.id: (context) => DrawerScreen(),
        ReportScreen.id: (context) => ReportScreen(),
      },
    );
  }
}
