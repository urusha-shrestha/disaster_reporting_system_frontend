import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/report/contact.dart';
import 'package:fyp/screens/report/dropDown.dart';
import 'confirm_screen.dart';
import 'date_picker.dart';
import 'description.dart';
import 'location.dart';
import 'time_picker.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _reportformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Form(
        key: _reportformKey,
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
                contact(),
                CustomButton(
                    onPressed: () {
                      setState(() {
                        print(globalTimeValue);
                        if (globalDateValue != null) {
                          dateVisible = false;
                          if (globalTimeValue != null) {
                            timeVisible = false;
                            if (dropDownValue != null) {
                              if (_reportformKey.currentState.validate()) {
                                showGeneralDialog(
                                    context: context,
                                    pageBuilder: (BuildContext buildContext,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return ConfirmDialog();
                                    });
                              }
                            } else {
                              typeVisible = true;
                            }
                          } else {
                            timeVisible = true;
                          }
                        } else {
                          dateVisible = true;
                        }
                      });
                    },
                    buttonText: 'Submit'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
