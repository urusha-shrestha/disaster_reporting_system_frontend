import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LogInButton extends StatefulWidget {
  LogInButton({this.formKey, this.email, this.password});
  final formKey;
  final String email;
  final String password;

  @override
  _LogInButtonState createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  _buildBody(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Positioned(
            left: MediaQuery.of(context).size.width * 0.30,
            bottom: MediaQuery.of(context).size.height * 0.02,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  onPressed: () {
                    if (widget.formKey.currentState.validate()) {
                      setState(() {
                        isLoading = !isLoading;
                      });
                      try {
                        logIn(widget.email, widget.password);
                      } on Exception {
                        createSnackBar('Could not log in', Colors.red, context);
                      } catch (error) {
                        createSnackBar('Could not log in', Colors.red, context);
                      }
                    }
                  },
                  buttonText: 'Login',
                )
              ],
            ),
          )
        : Loading();
  }

  logIn(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password,
    };

    var jsonResponse;

    var response = await http.post('$serverUrl/login', body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        sharedPreferences.setString("token", jsonResponse['token']);
        getReport(context);
        createSnackBar('Successfully logged in', Colors.green, context);
      }
    } else {
      setState(() {
        print(response.statusCode);
        isLoading = false;
        createSnackBar(
            'The email or password is incorrect', Colors.red, context);
      });
      print(response.body);
    }
  }
}
