import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp/components/confirm_text.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:fyp/screens/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditReport extends StatefulWidget {
  EditReport({@required this.reportData});
  final reportData;

  @override
  _EditReportState createState() => _EditReportState();
}

class _EditReportState extends State<EditReport> {
  BuildContext _context;
  final _editReportFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController locationController =
        new TextEditingController(text: '${widget.reportData['location']}');
    final TextEditingController contactController =
        new TextEditingController(text: '${widget.reportData['contact']}');
    final TextEditingController descriptionController =
        new TextEditingController(text: '${widget.reportData['description']}');
    _context = context;
    return SingleChildScrollView(
      child: Form(
        key: _editReportFormKey,
        child: AlertDialog(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              Text('Edit Report'),
            ],
          ),
          content: Container(
            child: Column(
              children: [
                ConfirmText(textValue: 'Date: ${widget.reportData['date']}'),
                SizedBox(
                  height: 10.0,
                ),
                ConfirmText(
                  textValue: 'Time: ${widget.reportData['time']}',
                ),
                SizedBox(
                  height: 10.0,
                ),
                ConfirmText(
                  textValue: 'Disaster: ${widget.reportData['disaster_type']}',
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                  controller: locationController,
                  border: true,
                  label: 'Location',
                  //initialValue: '${widget.reportData['location']}',
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This field cannot be empty";
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                  controller: contactController,
                  border: true,
                  label: 'Contact',
                  //initialValue: '${widget.reportData['contact']}',
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This field cannot be empty";
                    }
                    try {
                      int.parse(value);
                    } catch (_) {
                      return "This field cannot contain alphabets.";
                    }
                    if (value.length == 10 || value.length == 7) {
                      return null;
                    } else {
                      return "Must be of length either 7 or 10";
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomTextField(
                  controller: descriptionController,
                  border: true,
                  label: 'Description',
                  //initialValue: '${widget.reportData['description']}',
                  maxLines: 10,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This field cannot be empty";
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                isLoading == false
                    ? CustomButton(
                        onPressed: () {
                          print('Clicked');
                          if (_editReportFormKey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            editReport(
                                locationController.text.toString(),
                                contactController.text.toString(),
                                descriptionController.text.toString());
                          }
                        },
                        buttonText: 'Edit')
                    : Center(
                        child: Loading(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editReport(String location, contact, description) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var jsonResponse;
    Map data = {
      'location': location,
      'contact': contact,
      'description': description
    };

    String myUrl =
        "http://10.0.2.2:8000/api/editReport/${widget.reportData['id']}";
    final response = await http.put(myUrl,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: data);
    jsonResponse = json.decode(response.body);
    if (response.statusCode != 200) {
      Navigator.pop(_context);
      setState(() {
        isLoading = false;
      });
      createSnackBar(
          'Could not edit. Please try again', Colors.red, profileContext);
    } else {
      print('jsonResponse: ${jsonResponse["token"]}');
      getUsers(_context);
      setState(() {
        isLoading = false;
      });
      createSnackBar(
          'Report successfully edited', Colors.green, profileContext);
    }
  }
}
