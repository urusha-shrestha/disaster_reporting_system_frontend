import "package:flutter/material.dart";
import 'package:fyp/constants.dart';
import 'package:fyp/screens/report/report_form.dart';

BuildContext scaffoldContext;

class ReportScreen extends StatefulWidget {
  ReportScreen({this.userID});
  final userID;
  static const String id = 'report_screen';

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    scaffoldContext = context;
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kprimaryColour,
          leading: isDrawerOpen
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    setState(() {
                      xOffset = 230;
                      yOffset = 100;
                      scaleFactor = 0.8;
                      isDrawerOpen = true;
                    });
                  }),
          title: Text('Report A Disaster'),
        ),
        body: SingleChildScrollView(
          child: ReportForm(
            userID: widget.userID,
          ),
        ),
      ),
    );
  }
}
