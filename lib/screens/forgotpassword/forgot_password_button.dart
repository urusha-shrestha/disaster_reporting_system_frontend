import 'dart:convert';
import 'package:fyp/components/custom_button.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fyp/components/snackBar.dart';
import 'reset_password.dart';

class ForgotPasswordButton extends StatefulWidget {
  ForgotPasswordButton({this.email, this.formKey});
  final String email;
  final formKey;
  @override
  _ForgotPasswordButtonState createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends State<ForgotPasswordButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
        onPressed: () {
          if (widget.formKey.currentState.validate()) {
            sendEmail(widget.email);
          }
        },
        buttonText: 'Send Reset Link');
  }

  sendEmail(String email) async {
    Map data = {'email': email};
    var jsonResponse = null;
    var response = await http
        .post("http://192.168.1.185:8000/api/password/forgot", body: data);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          createSnackBar('Check your mail', Colors.green, context);
        });

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => ResetPassword()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        createSnackBar('Could not send email', Colors.red, context);
      });
      print(response.body);
      print('Response status: ${response.statusCode}');
    }
  }
}
