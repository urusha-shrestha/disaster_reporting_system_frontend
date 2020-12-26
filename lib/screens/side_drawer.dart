import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/stack.dart';

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
              GestureDetector(
                child: Text('Home'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => Stack1()),
                      (Route<dynamic> route) => false);
                },
              ),
              GestureDetector(
                child: Text('Report a Disaster'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => Stack2()),
                      (Route<dynamic> route) => false);
                },
              ),
              GestureDetector(
                child: Text('Articles'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => Stack3()),
                      (Route<dynamic> route) => false);
                },
              ),
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
