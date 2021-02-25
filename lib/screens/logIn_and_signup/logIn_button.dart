import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LogIn_Button extends StatefulWidget {
  LogIn_Button({this.formKey, this.email, this.password, this.isLoading});
  final formKey;
  final String email;
  final String password;
  bool isLoading;

  @override
  _LogIn_ButtonState createState() => _LogIn_ButtonState();
}

class _LogIn_ButtonState extends State<LogIn_Button> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.31,
      bottom: MediaQuery.of(context).size.height * 0.02,
      child: Align(
        alignment: Alignment(0, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {
                if (widget.formKey.currentState.validate()) {
                  signIn(widget.email, widget.password);
                }
                ;
              },
              buttonText: 'Login',
            ),
          ],
        ),
      ),
    );
  }

  signIn(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password,
    };
    var jsonResponse = null;

    var response =
        await http.post("http://192.168.0.110/api/login", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          widget.isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        getReport(context);
      }
    } else {
      setState(() {
        widget.isLoading = false;
      });
      print(response.body);
    }
  }
}
