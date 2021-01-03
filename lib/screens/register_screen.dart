/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'file:///C:/Users/Urusha/AndroidStudioProjects/fyp/lib/screens/logIn_and_signup/main_screen.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/constants.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  bool _isHidden = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),
        backgroundColor: kappBarColour,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          color: kbackgroundColour,
          child: Center(
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: kforegroundColour,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildResuableColumn(
                      label: 'Full Name',
                      controller: nameController,
                    ),
                    buildResuableColumn(
                      label: 'Email',
                      controller: emailController,
                    ),
                    buildResuableColumn(
                      label: 'Password',
                      controller: passwordController,
                    ),
                    buildResuableColumn(
                      label: 'Confirm Password',
                      controller: confirmPasswordController,
                    ),
                    CustomButton(
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                        });
                        register(nameController.text, emailController.text,
                            passwordController.text);
                      },
                      buttonText: 'Register',
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildResuableColumn({
    String label,
    TextEditingController controller,
    FieldValidator validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
          TextFormField(
            textAlign: TextAlign.center,
            decoration: kTextFieldDecoration.copyWith(
                hintText: label,
                suffixIcon: label == "Password" || label == "Confirm Password"
                    ? IconButton(
                        icon: _isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: _togglePasswordVisibility)
                    : null),
            obscureText: label == "Password" || label == "Confirm Password"
                ? _isHidden
                : false,
            controller: controller,
            autovalidate: true,
          ),
        ],
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
*/
