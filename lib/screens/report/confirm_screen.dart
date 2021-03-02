import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/controllers/networking.dart';
import 'package:fyp/screens/report/report_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';

class ConfirmDialog extends StatelessWidget {
  ConfirmDialog(
      {@required this.date,
      @required this.time,
      @required this.location,
      @required this.disasterType,
      @required this.contact,
      this.description});

  final String date;
  final String time;
  final String location;
  final String disasterType;
  final String contact;
  final String description;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: kprimaryColour), color: Colors.white60),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Container(
                      child: Text(
                        'Confirm Submission',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ),
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
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(color: kprimaryColour)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Confirm_Text(textValue: 'Date: $date'),
                        Confirm_Text(textValue: 'Time: $time'),
                        Confirm_Text(textValue: 'Location: $location'),
                        Confirm_Text(textValue: 'Disaster: $disasterType'),
                        Confirm_Text(
                            textValue: description.isEmpty
                                ? 'No description'
                                : 'Description: $description'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    onPressed: () {
                      sendReport(disasterType, location, date, time, contact,
                          description);
                    },
                    buttonText: 'Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendReport(
      String _typeController,
      String _locationController,
      String _dateController,
      String _timeController,
      String _contactController,
      String _descriptionController) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final key = 'token';
    final value = sharedPreferences.get(key) ?? 0;
    var status;
    var token;
    var jsonResponse = null;

    Map data = {
      'disaster_type': _typeController,
      'location': _locationController,
      'date': _dateController,
      'time': _timeController,
      'contact': _contactController,
      'description': _descriptionController
    };

    String myUrl = "http://192.168.0.104:8000/api/reports";
    final response = await http.post(myUrl,
        headers: {'Accept': 'application/json'}, body: data);

    status = response.body.contains('error');
    jsonResponse = json.decode(response.body);

    if (response.statusCode != 200) {
      print('jsonResponse: ${jsonResponse["error"]}');
      Navigator.pop(_context);
      createSnackBar('Could not submit', Colors.red, scaffoldContext);
    } else {
      print('jsonResponse:${jsonResponse["token"]}');
      /*_save(jsonResponse["token"]);*/
      Navigator.pop(_context);
      createSnackBar(
          'Report has been submitted', Colors.green, scaffoldContext);
      print('$scaffoldContext');
      print('Report has been sent');
    }
  }
}

class Confirm_Text extends StatelessWidget {
  const Confirm_Text({
    Key key,
    @required this.textValue,
  }) : super(key: key);

  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(
          decoration: TextDecoration.none, color: Colors.black, fontSize: 20),
    );
  }
}
