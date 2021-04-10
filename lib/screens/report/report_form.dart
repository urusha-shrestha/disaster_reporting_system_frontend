import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'components/dropDown.dart';
import 'components/confirm_screen.dart';
import 'components/contact.dart';
import 'components/date_picker.dart';
import 'components/description.dart';
import 'components/location.dart';
import 'components/time_picker.dart';

class ReportForm extends StatefulWidget {
  ReportForm({this.userID, this.categories});
  final userID;
  final categories;
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
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 4,
        child: Form(
          key: _reportformKey,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DatePicker(),
                  TimePicker(),
                  Location(
                    locationController: locationController,
                  ),
                  DropDown(
                    categories: widget.categories,
                  ),
                  DescriptionTextbox(
                    descriptionController: descriptionController,
                  ),
                  Contact(
                    contactController: contactController,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomButton(
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
                                            Animation<double>
                                                secondaryAnimation) {
                                          return ConfirmDialog(
                                            date: globalDateValue,
                                            time: globalTimeValue,
                                            disasterType: dropDownValue,
                                            location: locationController.text,
                                            contact: contactController.text
                                                .toString(),
                                            description:
                                                descriptionController.text,
                                            userID: widget.userID,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
