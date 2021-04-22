import 'package:flutter/material.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:fyp/screens/resetpassword/reset_password_button.dart';

class ResetPassword extends StatefulWidget {
  static const String id = 'screens.resetPassword';

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController tokenController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  final TextEditingController confirmPasswordController =
      new TextEditingController();

  bool isHidden = true;

  void passwordVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: kgradientBackground,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 150.0),
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Reset Password',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CustomTextField(
                                  border: false,
                                  label: 'Token',
                                  controller: tokenController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "This field cannot be empty";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CustomTextField(
                                  border: false,
                                  label: 'Password',
                                  controller: passwordController,
                                  icon: Icon(
                                    Icons.visibility_off,
                                    size: 24,
                                    color: kprimaryColour,
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "This field cannot be empty";
                                    }
                                  },
                                  hideText: isHidden,
                                  suffixIcon: IconButton(
                                    icon: isHidden
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: passwordVisibility,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CustomTextField(
                                  border: false,
                                  label: 'Confirm Password',
                                  controller: confirmPasswordController,
                                  icon: Icon(
                                    Icons.visibility_off,
                                    size: 24,
                                    color: kprimaryColour,
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "This field cannot be empty";
                                    } else if (value !=
                                        passwordController.text) {
                                      return "The password does not match";
                                    }
                                  },
                                  hideText: isHidden,
                                  suffixIcon: IconButton(
                                    icon: isHidden
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: passwordVisibility,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ResetPasswordButton(
                                    formKey: _formKey,
                                    token: tokenController,
                                    password: passwordController,
                                    confirmPassword: confirmPasswordController,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  CustomButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Body()),
                                            (route) => false);
                                      },
                                      buttonText: 'Cancel'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
