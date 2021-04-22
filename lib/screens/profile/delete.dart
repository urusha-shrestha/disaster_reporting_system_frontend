import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:fyp/screens/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeleteReport extends StatefulWidget {
  DeleteReport({@required this.reportID});
  final reportID;
  @override
  _DeleteReportState createState() => _DeleteReportState();
}

class _DeleteReportState extends State<DeleteReport> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
          Text('Confirm Delete'),
        ],
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Are you sure you want to delete this report?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      deleteReport();
                    },
                    buttonText: 'Yes'),
                SizedBox(
                  width: 30,
                ),
                CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    buttonText: 'No'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void deleteReport() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var jsonResponse;

    String myUrl = "$serverUrl/deleteReport/${widget.reportID}";

    final response = await http.delete(myUrl,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});

    jsonResponse = json.decode(response.body);

    if (response.statusCode != 200) {
      Navigator.pop(context);
      isLoading = false;
      createSnackBar(
          'Could not delete. Please try again.', Colors.red, profileContext);
    } else {
      getUsers(context);
      isLoading = false;
      createSnackBar(
          'Report deleted successfully', Colors.green, profileContext);
    }
  }
}
