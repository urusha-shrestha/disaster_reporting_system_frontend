import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/components/snackBar.dart';
import 'package:fyp/controllers/databasehelper.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RegisterButton extends StatefulWidget {
  RegisterButton(
      {this.formKey, this.name, this.email, this.password, this.isLoading});
  final formKey;
  final String name;
  final String email;
  final String password;
  bool isLoading;

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
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
                        register(widget.name, widget.email, widget.password);
                      }
                    },
                    buttonText: 'SignUp'),
              ],
            ),
          )
        : Loading();
  }

  register(String name, email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'name': name,
      'email': email,
      'password': password,
    };
    var jsonResponse;

    var response = await http.post("$serverUrl/register", body: data);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          isLoading = false;
        });
        createSnackBar('Successfully registered', Colors.green, context);
        sharedPreferences.setString("token", jsonResponse['token']);
        /*Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Body()),
            (Route<dynamic> route) => false);*/
      }
    } else {
      setState(() {
        isLoading = false;
        createSnackBar('Could not register', Colors.red, context);
      });
      print(response.body);
    }
  }
}
