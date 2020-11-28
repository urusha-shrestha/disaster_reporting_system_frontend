import 'package:flutter/material.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/constants.dart';

class ForgotPassword extends StatelessWidget {
  static const String id = 'forgotpassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kappBarColour,
      ),
      body: Container(
        color: kbackgroundColour,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: kforegroundColour,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please enter your email to receive a password reset link',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  RoundedButton(
                    onPressed: null,
                    buttonColor: kdarkColour,
                    buttonTitle: 'Send Reset Link',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
