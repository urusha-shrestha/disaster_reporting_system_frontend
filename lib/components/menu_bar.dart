import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class CustomMenuBar extends StatelessWidget {
  static const String id = 'menu_bar';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kbackgroundColour,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 150, 0),
        color: kdarkColour,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: null,
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 40.0, color: ktextColour),
                ),
              ),
              TextButton(
                  onPressed: null,
                  child: Text(
                    'Report',
                    style: TextStyle(fontSize: 40.0, color: ktextColour),
                  )),
              TextButton(
                  onPressed: null,
                  child: Text(
                    'Learn',
                    style: TextStyle(fontSize: 40.0, color: ktextColour),
                  )),
              SizedBox(
                height: 100.0,
              ),
              TextButton(
                  onPressed: null,
                  child: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 40.0, color: ktextColour),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
