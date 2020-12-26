import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/custom_clipper.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import '../forgotpassword.dart';
import 'customtext.dart';
import 'logIn_button.dart';

class Log_In extends StatelessWidget {
  Log_In(
      {this.formKey,
      this.isLogin,
      this.email,
      this.password,
      this.isHidden,
      this.passwordVisibility,
      this.isLoading});
  final formKey;
  bool isLogin;
  final email;
  final password;
  bool isHidden;
  final passwordVisibility;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: isLogin
          ? Positioned(
              left: 20,
              right: 20,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.98,
                child: Stack(
                  children: [
                    Container(
                      child: ClipPath(
                        clipper: SignUpClipper(),
                        child: HeadingText(label: 'Sign Up'),
                      ),
                    ),
                    CustomPaint(
                      painter: loginShadowPaint(),
                      child: ClipPath(
                        clipper: loginClipper(),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.92,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30, top: 20),
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 75,
                                margin: EdgeInsets.only(left: 30),
                                height: 12,
                                child: Card(
                                  elevation: 2,
                                  color: kprimaryColour,
                                ),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: EdgeInsets.only(left: 30),
                                height: 40,
                                child: CustomTextField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
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
                              SizedBox(height: 30),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: EdgeInsets.only(left: 30),
                                height: 40,
                                child: CustomTextField(
                                  controller: password,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'This field cannot be empty';
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
                                ),
                              ),
                              SizedBox(height: 30),
                              Container(
                                margin: EdgeInsets.only(right: 28),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, ForgotPassword.id);
                                      },
                                      child: Text(
                                        "Forgot Password ?",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: kprimaryColour),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    LogIn_Button(
                      formKey: formKey,
                      email: email.text,
                      password: password.text,
                      isLoading: isLoading,
                    ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}
