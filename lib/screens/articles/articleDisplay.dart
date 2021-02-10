import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class Display extends StatelessWidget {
  static const String id = 'articleDisplay';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        backgroundColor: kprimaryColour,
      ),
      body: Container(),
    );
  }
}
