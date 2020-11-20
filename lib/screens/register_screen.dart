import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/screens/logIn_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fyp/components/menu_bar.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/constants.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),
        backgroundColor: kappBarColour,
      ),
      body: Container(
        color: kbackgroundColour,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: SingleChildScrollView(
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: kforegroundColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Reusable_column(
                    label: 'Full Name',
                    controller: nameController,
                  ),
                  Reusable_column(
                    label: 'Email',
                    controller: emailController,
                  ),
                  Reusable_column(
                    label: 'Password',
                    controller: passwordController,
                  ),
                  Reusable_column(label: 'Confirm Password'),
                  RoundedButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      register(nameController.text, emailController.text,
                          passwordController.text);
                    },
                    buttonColor: kdarkColour,
                    buttonTitle: 'Register',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  register(String name, email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'name': name,
      'email': email,
      'password': password,
    };
    var jsonResponse = null;

    var response =
        await http.post("http://192.168.0.123:8000/api/register", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LogInScreen()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}

class Reusable_column extends StatelessWidget {
  Reusable_column({this.label, this.controller});
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20.0,
                color: ktextColour,
              ),
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: kTextFieldDecoration.copyWith(hintText: label),
            controller: controller,
          ),
        ],
      ),
    );
  }
}
