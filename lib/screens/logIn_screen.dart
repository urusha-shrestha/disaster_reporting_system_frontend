import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp/screens/forgotpassword.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/screens/register_screen.dart';
import 'package:fyp/screens/reported_disaster_screen.dart';
import '../constants.dart';

class LogInScreen extends StatefulWidget {
  static const String id = 'logIn_page';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isLoading = false;
  bool _isHidden = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String email;
  String password;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kbackgroundColour,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
          child: Card(
            color: kforegroundColour,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 10.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 15.0),
                  child: Container(
                    color: Colors.white,
                    height: 145.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            labelText: 'Email',
                          ),
                          autovalidate: true,
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Required"),
                              EmailValidator(errorText: "Not a Valid Email"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isHidden,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: _isHidden
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                          autovalidate: true,
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Required"),
                              MinLengthValidator(6,
                                  errorText: "Must be at least 6 characters"),
                              MaxLengthValidator(15,
                                  errorText: "Must be less than 15 characters"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RoundedButton(
                            buttonColor: kdarkColour,
                            buttonTitle: 'Log In',
                            onPressed: () {
                              setState(() {
                                _isLoading = true;
                              });
                              signIn(email, password);
                            }),
                        RoundedButton(
                            buttonColor: kdarkColour,
                            buttonTitle: 'Register',
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterScreen.id);
                            }),
                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, ForgotPassword.id);
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
        await http.post("http://192.168.0.108:8000/api/login", body: data);
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
            MaterialPageRoute(
                builder: (BuildContext context) => ReportedDisasterScreen()),
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
