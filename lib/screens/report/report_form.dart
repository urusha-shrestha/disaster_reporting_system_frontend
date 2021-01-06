import 'package:flutter/material.dart';
import 'package:fyp/screens/report/dropDown.dart';
import 'date_picker.dart';
import 'description.dart';
import 'location.dart';
import 'time_picker.dart';

class ReportForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              date_picker(),
              time_picker(),
              location(),
              dropDown(),
              description_textbox(),
            ],
          ),
        ),
      ),
    );
  }
}
