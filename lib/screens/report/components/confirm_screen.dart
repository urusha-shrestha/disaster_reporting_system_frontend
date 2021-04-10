import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/screens/report/report_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';
import 'dart:io';

class ConfirmDialog extends StatefulWidget {
  ConfirmDialog(
      {@required this.date,
      @required this.time,
      @required this.location,
      @required this.disasterType,
      @required this.contact,
      this.description,
      @required this.userID});

  final String date;
  final String time;
  final String location;
  final String disasterType;
  final String contact;
  final String description;
  final userID;

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kprimaryColour, width: 2),
              color: Colors.white70),
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kprimaryColour, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConfirmText(textValue: 'Date: ${widget.date}'),
                        ConfirmText(textValue: 'Time: ${widget.time}'),
                        ConfirmText(textValue: 'Location: ${widget.location}'),
                        ConfirmText(
                            textValue: 'Disaster: ${widget.disasterType}'),
                        ConfirmText(
                            textValue: widget.description.isEmpty
                                ? 'No description'
                                : 'Description: ${widget.description}'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: isLoading == false
                    ? CustomButton(
                        onPressed: () {
                          setState(() {
                            isLoading = !isLoading;
                          });
                          sendReport(
                              widget.disasterType,
                              widget.location,
                              widget.date,
                              widget.time,
                              widget.contact,
                              widget.description,
                              widget.userID);
                          print(widget.userID.runtimeType);
                        },
                        buttonText: 'Confirm')
                    : Center(
                        child: Loading(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendReport(_typeController, _locationController, _dateController,
      _timeController, _contactController, _descriptionController, id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    /*final key = 'token';*/

    var jsonResponse;

    Map data = {
      'disaster_type': _typeController,
      'location': _locationController,
      'date': _dateController,
      'time': _timeController,
      'contact': _contactController,
      'description': _descriptionController,
      'user_id': id.toString()
    };

    String myUrl = "http://10.0.2.2:8000/api/reports";
    final response = await http.post(myUrl,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: data);

    /*var status = response.body.contains('error');*/
    jsonResponse = json.decode(response.body);

    if (response.statusCode != 200) {
      print('jsonResponse: ${jsonResponse["error"]}');
      Navigator.pop(_context);
      isLoading = false;
      createSnackBar('Could not submit', Colors.red, scaffoldContext);
    } else {
      print('jsonResponse:${jsonResponse["token"]}');
      /*_save(jsonResponse["token"]);*/
      Navigator.pop(_context);
      isLoading = false;
      createSnackBar(
          'Report has been submitted', Colors.green, scaffoldContext);
      print('$scaffoldContext');
      print('Report has been sent');
    }
  }
}

class ConfirmText extends StatelessWidget {
  const ConfirmText({
    @required this.textValue,
  });

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
