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
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController contactController = new TextEditingController();
  final TextEditingController descriptionController =
      new TextEditingController();

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
                location(
                  locationController: locationController,
                ),
                dropDown(),
                description_textbox(
                  descriptionController: descriptionController,
                ),
                contact(
                  contactController: contactController,
                ),
                CustomButton(
                    onPressed: () {
                      setState(() {
                        print(descriptionController.text);
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
                                      return ConfirmDialog(
                                        date: globalDateValue,
                                        time: globalTimeValue,
                                        disasterType: dropDownValue,
                                        location: locationController.text,
                                        contact: contactController.text,
                                        description: descriptionController.text,
                                      );
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
