import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/custom_clipper.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import 'customtext.dart';
import 'register_button.dart';

class SignUp extends StatelessWidget {
  SignUp(
      {this.formKey,
      this.isLogin,
      this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.isHidden,
      this.passwordVisibility,
      this.isLoading});
  final formKey;
  final bool isLogin;
  final name;
  final email;
  final password;
  final confirmPassword;
  final bool isHidden;
  final passwordVisibility;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Positioned(
          top: 5,
          left: 20,
          right: 20,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: EdgeInsets.only(bottom: 20),
            child: Stack(
              children: [
                CustomPaint(
                  painter: SignupShadowPaint(),
                  child: Stack(
                    children: [
                      Container(
                        child: ClipPath(
                          clipper: LoginClipper(),
                          child: HeadingText(label: 'Log In'),
                        ),
                      ),
                      ClipPath(
                        clipper: SignUpClipper(),
                        child: Container(
                          height: 500,
                          width: MediaQuery.of(context).size.width * 0.92,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 30, top: 20, right: 20),
                                    child: Text(
                                      "Signup",
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Container(
                                    width: 85,
                                    margin:
                                        EdgeInsets.only(left: 30, right: 25),
                                    height: 12,
                                    child: Card(
                                      elevation: 2,
                                      color: kprimaryColour,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: EdgeInsets.only(left: 30),
                                height: 60,
                                child: CustomTextField(
                                  border: false,
                                  controller: name,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "This field cannot be empty";
                                    }
                                    return null;
                                  },
                                  label: 'Name',
                                  icon: Icon(
                                    Icons.person_rounded,
                                    size: 24,
                                    color: kprimaryColour,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: EdgeInsets.only(left: 30),
                                height: 60,
                                child: CustomTextField(
                                  border: false,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: email,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "This field cannot be empty";
                                    } else if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return "Please enter a valid email address.";
                                    } else
                                      return null;
                                  },
                                  icon: Icon(
                                    Icons.mail,
                                    size: 24,
                                    color: kprimaryColour,
                                  ),
                                  label: 'Email Address',
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: EdgeInsets.only(left: 30),
                                height: 60,
                                child: CustomTextField(
                                  border: false,
                                  controller: password,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "This field cannot be empty";
                                    }
                                    return null;
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.eyeSlash,
                                    size: 20,
                                    color: kprimaryColour,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: isHidden
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: passwordVisibility,
                                  ),
                                  label: 'Password',
                                  hideText: isHidden,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: EdgeInsets.only(left: 30),
                                height: 60,
                                child: CustomTextField(
                                  border: false,
                                  controller: confirmPassword,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "This field cannot be empty";
                                    } else if (value != password.text) {
                                      return "The password does not match";
                                    }
                                    return null;
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.eyeSlash,
                                    size: 20,
                                    color: kprimaryColour,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: isHidden
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    onPressed: passwordVisibility,
                                  ),
                                  label: 'Confirm Password',
                                  hideText: isHidden,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RegisterButton(
                  formKey: formKey,
                  name: name.text,
                  email: email.text,
                  password: password.text,
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        )
        /*: Container(),*/
        );
  }
}
