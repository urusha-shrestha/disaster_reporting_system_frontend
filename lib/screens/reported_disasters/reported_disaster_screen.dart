import 'package:flutter/material.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/screens/app_bar.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:fyp/screens/reported_disasters/body.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportedDisasterScreen extends StatefulWidget {
  ReportedDisasterScreen(
      {this.reportData, this.dataLength, this.categoryImage});
  final reportData;
  final int dataLength;
  final categoryImage;

  static const String id = 'reported_disaster_screen';

  @override
  _ReportedDisasterScreenState createState() => _ReportedDisasterScreenState();
}

class _ReportedDisasterScreenState extends State<ReportedDisasterScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    //checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Body()),
          (Route<dynamic> route) => false);
    }
  }

  Widget build(BuildContext context) {
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
          title: 'Reported Disasters',
        ),
        body: ReportedBody(
          reportData: widget.reportData,
          dataLength: widget.dataLength,
          categoryImage: widget.categoryImage,
        ),
      ),
    );
  }
}
