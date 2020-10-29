import 'package:flutter/material.dart';
import 'package:fyp/components/menu_bar.dart';
import 'package:fyp/components/rounded_button.dart';
import 'package:fyp/constants.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = 'register_screen';
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
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: kforegroundColour,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Reusable_column(label: 'First Name'),
                Reusable_column(label: 'Last Name'),
                Reusable_column(label: 'Email'),
                Reusable_column(label: 'Password'),
                Reusable_column(label: 'Confirm Password'),
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CustomMenuBar.id);
                  },
                  buttonColor: kdarkColour,
                  buttonTitle: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Reusable_column extends StatelessWidget {
  Reusable_column({this.label});
  final String label;

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
          ),
        ],
      ),
    );
  }
}
