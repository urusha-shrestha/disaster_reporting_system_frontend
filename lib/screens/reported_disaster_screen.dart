import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/logIn_screen.dart';
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
          MaterialPageRoute(builder: (BuildContext context) => LogInScreen()),
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
        appBar: AppBar(
          backgroundColor: kappBarColour,
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
          title: Text('Reported Disasters'),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: kforegroundColour,
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: kbackgroundColour,
                    thickness: 8,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      leading: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        'One',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
