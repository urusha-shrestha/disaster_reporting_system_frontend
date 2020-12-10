import "package:flutter/material.dart";
import 'package:fyp/constants.dart';
import 'file:///C:/Users/Urusha/AndroidStudioProjects/fyp/lib/screens/side_drawer.dart';

class ReportScreen extends StatelessWidget {
  static const String id = 'report_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kappBarColour,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, CustomMenuBar.id);
            },
            child: Icon(Icons.menu)),
        title: Text('Report A Disaster'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kbackgroundColour,
        ),
      ),
    );
  }
}
