import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/custom_clipper.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import 'package:fyp/components/loading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../constants.dart';
import '../forgotpassword/forgotpassword.dart';
import 'customtext.dart';
import 'logIn_button.dart';

class LogIn extends StatefulWidget {
  LogIn({
    this.formKey,
    this.isLogin,
    this.email,
    this.password,
    this.isHidden,
    this.passwordVisibility,
  });
  final formKey;
  final bool isLogin;
  final email;
  final password;
  final bool isHidden;
  final passwordVisibility;

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: widget.isLogin
          ? Positioned(
              left: 20,
              right: 20,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.98,
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: LoginShadowPaint(),
                      child: Stack(
                        children: [
                          Container(
                            child: ClipPath(
                              clipper: SignUpClipper(),
                              child: HeadingText(label: 'Sign Up'),
                            ),
                          ),
                          ClipPath(
                            clipper: LoginClipper(),
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    margin: EdgeInsets.only(left: 30),
                                    height: 40,
                                    child: CustomTextField(
                                      controller: widget.email,
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    margin: EdgeInsets.only(left: 30),
                                    height: 40,
                                    child: CustomTextField(
                                      controller: widget.password,
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
                                        icon: widget.isHidden
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                        onPressed: widget.passwordVisibility,
                                      ),
                                      label: 'Password',
                                      hideText: widget.isHidden,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    margin: EdgeInsets.only(right: 28),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
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
                        ],
                      ),
                    ),
                    LogInButton(
                      formKey: widget.formKey,
                      email: widget.email.text,
                      password: widget.password.text,
                    ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}
