import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/screens/logIn_and_signup/main_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Register_Button extends StatefulWidget {
  Register_Button(
      {this.formKey, this.name, this.email, this.password, this.isLoading});
  final formKey;
  final String name;
  final String email;
  final String password;
  bool isLoading;

  @override
  _Register_ButtonState createState() => _Register_ButtonState();
}

class _Register_ButtonState extends State<Register_Button> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.31,
      bottom: 18,
      child: Align(
        alignment: Alignment(0, 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
                onPressed: () {
                  if (widget.formKey.currentState.validate()) {
                    register(widget.name, widget.email, widget.password);
                  }
                  ;
                },
                buttonText: 'SignUp'),
          ],
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
        await http.post("http://192.168.0.108:8000/api/register", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          widget.isLoading = false;
          /*Fluttertoast.showToast(
            msg: "Successfully Registered.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );*/
        });
        sharedPreferences.setString("token", jsonResponse['token']);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LogInScreen()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        widget.isLoading = false;
      });
      print(response.body);
    }
  }
}