import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fyp/components/menu_bar.dart';
import 'package:fyp/screens/logIn_screen.dart';
import 'package:fyp/screens/register_screen.dart';
import 'package:fyp/screens/report_screen.dart';
import 'package:fyp/screens/reported_disaster_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReportedDisasterScreen(),
      initialRoute: ReportedDisasterScreen.id,
      routes: {
        LogInScreen.id: (context) => LogInScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ReportedDisasterScreen.id: (context) => ReportedDisasterScreen(),
        CustomMenuBar.id: (context) => CustomMenuBar(),
        ReportScreen.id: (context) => ReportScreen(),
      },
    );
  }
}
