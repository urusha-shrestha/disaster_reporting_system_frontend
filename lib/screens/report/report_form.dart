import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/report/dropDown.dart';
import 'confirm_screen.dart';
import 'date_picker.dart';
import 'description.dart';
import 'location.dart';
import 'time_picker.dart';

class ReportForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: kprimaryColour)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              date_picker(),
              time_picker(),
              location(),
              dropDown(),
              description_textbox(),
              CustomButton(
                  onPressed: () {
                    showGeneralDialog(
                        context: context,
                        pageBuilder: (BuildContext buildContext,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return ConfirmDialog();
                        });
                  },
                  buttonText: 'Submit'),
            ],
          ),
        ),
      ),
    );
  }
}
