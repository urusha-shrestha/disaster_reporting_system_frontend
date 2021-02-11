import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import 'package:fyp/constants.dart';

class ForgotPassword extends StatelessWidget {
  static const String id = 'screens.forgotpassword';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          decoration: kgradientBackground,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80.0),
            child: Center(
              child: Container(
                child: Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Please enter your email to receive a password reset link',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomTextField(
                            label: 'Email',
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
                          height: 50.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    print("validated");
                                  }
                                },
                                buttonText: 'Send Reset Link'),
                            SizedBox(
                              width: 50.0,
                            ),
                            CustomButton(
                                onPressed: () {
                                  Navigator.pop(context);
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
    );
  }
}
