import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:fyp/screens/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  BuildContext _context;

  final _editNameFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Form(
      key: _editNameFormKey,
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
            Text('Enter new username'),
          ],
        ),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.22,
          child: Column(
            children: [
              CustomTextField(
                label: 'name',
                controller: nameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return "This field cannot be empty";
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              isLoading == false
                  ? CustomButton(
                      onPressed: () {
                        if (_editNameFormKey.currentState.validate()) {
                          editUser(nameController.text.toString());
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
    );
  }

  void editUser(name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    var jsonResponse;
    Map data = {'name': name};
    print("reached here");
    String myUrl = "http://10.0.2.2:8000/api/editUser";
    print('code working');
    final response = await http.put(myUrl,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: data);
    print('everything fine');
    jsonResponse = json.decode(response.body);
    print('Here');
    if (response.statusCode != 200) {
      print(response.statusCode);
      print('jsonResponse: ${jsonResponse["error"]}');
      Navigator.pop(_context);
      isLoading = false;
      createSnackBar('Could not edit', Colors.red, profileContext);
    } else {
      print('jsonResponse: ${jsonResponse["token"]}');
      getUsers(context);
      isLoading = false;
      createSnackBar('Username edited', Colors.green, profileContext);
    }
  }
}
