import "package:flutter/material.dart";
import 'package:fyp/screens/app_bar.dart';
import 'package:fyp/screens/report/report_form.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

BuildContext scaffoldContext;

class ReportScreen extends StatefulWidget {
  ReportScreen({this.userID, this.categories});
  final userID;
  final categories;
  static const String id = 'report_screen';

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool loading = false;
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
        backgroundColor: Colors.grey.shade300,
        appBar: buildAppBar(
          isDrawerOpen: isDrawerOpen,
          onPressedOpen: () {
            setState(() {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
            });
          },
          onPressedClosed: () {
            setState(() {
              xOffset = 230;
              yOffset = 100;
              scaleFactor = 0.8;
              isDrawerOpen = true;
            });
          },
          title: 'Report a Disaster',
        ),
        body: SingleChildScrollView(
          child:
              ReportForm(userID: widget.userID, categories: widget.categories),
        ),
      ),
    );
  }
}
