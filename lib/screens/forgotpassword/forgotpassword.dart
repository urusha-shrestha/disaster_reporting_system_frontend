import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/forgotpassword/forgot_password_button.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = 'screens.forgotpassword';
  final TextEditingController emailController = new TextEditingController();

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //final TextEditingController emailController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: kgradientBackground,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 160.0),
                child: Center(
                  child: Container(
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Please enter your email to receive an email with token',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CustomTextField(
                                border: false,
                                label: 'Email',
                                controller: widget.emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "This field cannot be empty.";
                                  } else if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return "Please enter a valid email address";
                                  } else
                                    return null;
                                },
                                icon: Icon(
                                  Icons.mail,
                                  size: 24,
                                  color: kprimaryColour,
                                ),
                                hideText: false,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ForgotPasswordButton(
                                  formKey: _formKey,
                                  email: widget.emailController,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                CustomButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      print(widget.emailController.text);
                                    },
                                    buttonText: 'Back'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
