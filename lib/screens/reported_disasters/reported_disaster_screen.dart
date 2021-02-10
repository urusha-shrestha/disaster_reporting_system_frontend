import 'package:flutter/material.dart';
import 'package:fyp/screens/app_bar.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:fyp/screens/reported_disasters/body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyp/controllers/databasehelper.dart';

class ReportedDisasterScreen extends StatefulWidget {
  ReportedDisasterScreen({this.reportData, this.dataLength});
  final reportData;
  final dataLength;

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
  var data;

  @override
  void initState() {
    super.initState();
    //checkLoginStatus();
    //getReport();
  }

  getReport() async {
    DatabaseHelper databaseHelper = DatabaseHelper();
    var reportData = await databaseHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ReportedDisasterScreen(
        reportData: reportData,
        dataLength: reportData.length,
      );
    }));
  }

  Future<List> getreportsData() async {
    final response = await http.get("http://192.168.0.108:8000/api/reports");
    return json.decode(response.body);
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Body()),
          (Route<dynamic> route) => false);
    }
  }

  @override
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
        body: ReportedBody(),
      ),
    );
  }
}
