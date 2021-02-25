import 'package:flutter/material.dart';
import 'package:fyp/components/menu_bar.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/logIn_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportedDisasterScreen extends StatefulWidget {
  static const String id = 'reported_disaster_screen';

  @override
  _ReportedDisasterScreenState createState() => _ReportedDisasterScreenState();
}

class _ReportedDisasterScreenState extends State<ReportedDisasterScreen> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kappBarColour,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, CustomMenuBar.id);
            },
            child: Icon(Icons.menu)),
        title: Text('Reported Disasters'),
      ),
      body: Container(
        color: kbackgroundColour,
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
    );
  }
}
