import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/logIn_screen.dart';
import 'package:fyp/screens/report_screen.dart';
import 'package:fyp/screens/reported_disaster_screen.dart';

class DrawerScreen extends StatelessWidget {
  static const String id = 'side_drawer';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, kprimaryColour],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person_rounded),
              Text('USERNAME'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(child: Text('Home')),
              GestureDetector(child: Text('Report a Disaster')),
              GestureDetector(child: Text('Articles')),
            ],
          ),
          Row(
            children: [
              Icon(Icons.settings),
              Text('Settings'),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              GestureDetector(child: Text('Log Out')),
            ],
          ),
        ],
      ),
    );
  }
}
