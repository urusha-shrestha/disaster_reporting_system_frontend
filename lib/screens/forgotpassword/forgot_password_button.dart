import 'dart:convert';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fyp/components/snackBar.dart';
import '../resetpassword/reset_password.dart';

class ForgotPasswordButton extends StatefulWidget {
  ForgotPasswordButton({this.email, this.formKey});
  final email;
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
            setState(() {
              isLoading = !isLoading;
            });
            print(widget.email.text);
            sendEmail(widget.email.text);
          }
        },
        buttonText: 'Send Email');
  }

  sendEmail(String email) async {
    Map data = {'email': email};

    var jsonResponse;
    var response = await http.post("$serverUrl/password/forgot", body: data);

    /* if (response.statusCode == 302) {
      print('response 302');
      */ /*sendEmail(widget.email);*/ /*
      if (response.headers.containsKey('location')) {
        print(response.headers.toString());
        final getResponse = await http.post(
            "${response.headers["location"]}/api/password/forgot",
            body: data);
        print('getResponse.statusCode:' + getResponse.statusCode.toString());
      }
    } else */
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          isLoading = false;
          createSnackBar('Check your mail', Colors.green, context);
        });

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => ResetPassword()),
            (Route<dynamic> route) => false);
      }
    } else if (response.statusCode == 404) {
      var message = json.decode(response.body)['message'];
      setState(() {
        isLoading = false;
        createSnackBar(message, Colors.red, context);
      });
      print(email);
      print(json.decode(response.body)['message']);
      print('Response status: ${response.statusCode}');
    } else {
      setState(() {
        isLoading = false;
        createSnackBar('Could not send email. Try again', Colors.red, context);
      });
      print(email);
      print(json.decode(response.body)['message']);
      print('Response status: ${response.statusCode}');
    }
  }
}
