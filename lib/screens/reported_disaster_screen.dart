import 'package:flutter/material.dart';
import 'package:fyp/components/menu_bar.dart';
import 'package:fyp/constants.dart';

class ReportedDisasterScreen extends StatelessWidget {
  static const String id = 'reported_disaster_screen';
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
