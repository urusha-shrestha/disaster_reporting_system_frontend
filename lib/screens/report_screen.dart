import "package:flutter/material.dart";
import 'package:fyp/constants.dart';
import 'package:fyp/components/menu_bar.dart';

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
      body: Container(
        color: kbackgroundColour,
      ),
    );
  }
}
