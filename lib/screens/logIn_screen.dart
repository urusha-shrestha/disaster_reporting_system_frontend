import 'package:flutter/material.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/screens/register_screen.dart';
import 'package:fyp/screens/reported_disaster_screen.dart';
import '../constants.dart';

class LogInScreen extends StatelessWidget {
  static const String id = 'logIn_page';
  String email;
  String password;
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
                      horizontal: 60.0, vertical: 40.0),
                  child: Container(
                    color: Colors.white,
                    height: 150.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'email',
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'password',
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RoundedButton(
                          buttonColor: kdarkColour,
                          buttonTitle: 'Log In',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, ReportedDisasterScreen.id);
                          }),
                      RoundedButton(
                          buttonColor: kdarkColour,
                          buttonTitle: 'Register',
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
