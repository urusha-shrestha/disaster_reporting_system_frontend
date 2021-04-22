import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResetPasswordButton extends StatefulWidget {
  ResetPasswordButton(
      {this.formKey, this.token, this.password, this.confirmPassword});
  final formKey;
  final token;
  final password;
  final confirmPassword;
  @override
  _ResetPasswordButtonState createState() => _ResetPasswordButtonState();
}

class _ResetPasswordButtonState extends State<ResetPasswordButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      buttonText: 'Reset',
      onPressed: () {
        if (widget.formKey.currentState.validate()) {
          print('validated');
          reset(widget.token.text, widget.password.text,
              widget.confirmPassword.text);
          print('end');
        }
      },
    );
  }

  reset(String token, password, confirmPassword) async {
    Map data = {
      'token': token,
      'password': password,
      'password_confirm': confirmPassword
    };

    var jsonResponse;
    var response = await http.post("$serverUrl/password/reset", body: data);
    print('reached here');
    if (response != null) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        setState(() {
          createSnackBar('Password reset successful', Colors.green, context);
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Body()),
            (route) => false);
      } else if (response.statusCode == 400) {
        setState(() {
          createSnackBar(
              'Invalid token. Please enter a valid token', Colors.red, context);
        });
        print(response.body);
        print('Response status: ${response.statusCode}');
      } else {
        setState(() {
          createSnackBar('Error. Could not reset password. Please try again',
              Colors.red, context);
          print('Error');
        });
        print(response.body);
        print('Response status: ${response.statusCode}');
      }
    } else {
      setState(() {
        createSnackBar('Error. Could not reset password. Please try again',
            Colors.red, context);
        print('Error');
      });
      print(response.body);
      print('Response status: ${response.statusCode}');
    }
  }
}
