import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/screens/forgotpassword.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fyp/components/custom_button.dart';
import 'package:fyp/screens/reported_disaster_screen.dart';
import '../constants.dart';
import '../components/custom_clipper.dart';
import '../components/custom_text_form_field.dart';

class LogInScreen extends StatefulWidget {
  static const String id = 'logIn_page';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool islogin = true;

  bool _isLoading = false;
  bool _isHidden = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String email;
  String password;

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [kprimaryColour, Colors.white],
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome!",
                            style: GoogleFonts.roboto(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: kprimaryColour,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Stack(
                        children: [
                          Form(
                            key: _formKey,
                            child: islogin
                                ? Positioned(
                                    left: 20,
                                    right: 20,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      width: MediaQuery.of(context).size.width *
                                          0.98,
                                      child: Stack(
                                        children: [
                                          Container(
                                            child: ClipPath(
                                              clipper: SignUpClipper(),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.7,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.92,
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30,
                                                          top: 20,
                                                          right: 30),
                                                      child: Text(
                                                        "SignUp",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 40,
                                                          color:
                                                              Colors.grey[400],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          CustomPaint(
                                            painter: loginShadowPaint(),
                                            child: ClipPath(
                                              clipper: loginClipper(),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.7,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.92,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 30, top: 20),
                                                      child: Text(
                                                        "Login",
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                      margin: EdgeInsets.only(
                                                          left: 30),
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
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      margin: EdgeInsets.only(
                                                          left: 30),
                                                      height: 40,
                                                      child: CustomTextField(
                                                        validator: (value) {
                                                          if (value.isEmpty) {
                                                            return "This field cannot be empty";
                                                          }
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
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                      margin: EdgeInsets.only(
                                                          left: 30),
                                                      height: 40,
                                                      child: CustomTextField(
                                                        validator: (value) {
                                                          if (value.isEmpty) {
                                                            return 'This field cannot be empty';
                                                          }
                                                          return null;
                                                        },
                                                        icon: Icon(
                                                          FontAwesomeIcons
                                                              .eyeSlash,
                                                          size: 20,
                                                          color: kprimaryColour,
                                                        ),
                                                        suffixIcon: IconButton(
                                                          icon: _isHidden
                                                              ? Icon(Icons
                                                                  .visibility_off)
                                                              : Icon(Icons
                                                                  .visibility),
                                                          onPressed:
                                                              _togglePasswordVisibility,
                                                        ),
                                                        label: 'Password',
                                                      ),
                                                    ),
                                                    SizedBox(height: 30),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 28),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator
                                                                  .pushReplacementNamed(
                                                                      context,
                                                                      ForgotPassword
                                                                          .id);
                                                            },
                                                            child: Text(
                                                              "Forgot Password ?",
                                                              style: GoogleFonts.roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 12,
                                                                  color:
                                                                      kprimaryColour),
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
                                          Positioned(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                            child: Align(
                                              alignment: Alignment(0, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CustomButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState
                                                          .validate()) {
                                                        Navigator.of(context)
                                                            .pushAndRemoveUntil(
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        ReportedDisasterScreen()),
                                                                (Route<dynamic>
                                                                        route) =>
                                                                    false);
                                                        /*Scaffold.of(context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    'Processing Data')));*/
                                                      }
                                                      ;
                                                    },
                                                    buttonText: 'Login',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                          islogin == false
                              ? Form(
                                  child: Positioned(
                                    top: 5,
                                    left: 20,
                                    right: 20,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          CustomPaint(
                                            painter: signupShadowPaint(),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  child: ClipPath(
                                                    clipper: loginClipper(),
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.7,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.92,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.8),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 30,
                                                                    top: 20,
                                                                    right: 30),
                                                            child: Text(
                                                              "Login",
                                                              style: GoogleFonts.roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 40,
                                                                  color: Colors
                                                                          .grey[
                                                                      400]),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                ClipPath(
                                                  clipper: SignUpClipper(),
                                                  child: Container(
                                                    height: 500,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.92,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Spacer(),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 30,
                                                                      top: 20,
                                                                      right:
                                                                          20),
                                                              child: Text(
                                                                "Signup",
                                                                style: GoogleFonts.roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        32,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Spacer(),
                                                            Container(
                                                              width: 85,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 30,
                                                                      right:
                                                                          25),
                                                              height: 12,
                                                              child: Card(
                                                                elevation: 2,
                                                                color:
                                                                    kprimaryColour,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 60),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 30),
                                                          height: 60,
                                                          child:
                                                              CustomTextField(
                                                            validator: null,
                                                            icon: Icon(
                                                              Icons.mail,
                                                              size: 24,
                                                              color:
                                                                  kprimaryColour,
                                                            ),
                                                            label:
                                                                'Email Address',
                                                          ),
                                                        ),
                                                        SizedBox(height: 30),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 30),
                                                          height: 60,
                                                          child:
                                                              CustomTextField(
                                                            validator: null,
                                                            icon: Icon(
                                                              FontAwesomeIcons
                                                                  .eyeSlash,
                                                              size: 20,
                                                              color:
                                                                  kprimaryColour,
                                                            ),
                                                            suffixIcon:
                                                                IconButton(
                                                              icon: _isHidden
                                                                  ? Icon(Icons
                                                                      .visibility_off)
                                                                  : Icon(Icons
                                                                      .visibility),
                                                              onPressed:
                                                                  _togglePasswordVisibility,
                                                            ),
                                                            label: 'Password',
                                                          ),
                                                        ),
                                                        SizedBox(height: 30),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.7,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 30),
                                                          height: 60,
                                                          child:
                                                              CustomTextField(
                                                            validator: null,
                                                            icon: Icon(
                                                              FontAwesomeIcons
                                                                  .eyeSlash,
                                                              size: 20,
                                                              color:
                                                                  kprimaryColour,
                                                            ),
                                                            suffixIcon:
                                                                IconButton(
                                                              icon: _isHidden
                                                                  ? Icon(Icons
                                                                      .visibility_off)
                                                                  : Icon(Icons
                                                                      .visibility),
                                                              onPressed:
                                                                  _togglePasswordVisibility,
                                                            ),
                                                            label:
                                                                'Confirm Password',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.31,
                                            bottom: 18,
                                            child: Align(
                                              alignment: Alignment(0, 40),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CustomButton(
                                                      onPressed: null,
                                                      buttonText: 'SignUp'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.07,
                left: MediaQuery.of(context).size.width * 0.43,
                child: GestureDetector(
                  onTap: () {
                    if (islogin) {
                      setState(() {
                        islogin = false;
                      });
                    } else {
                      setState(() {
                        islogin = true;
                      });
                    }
                  },
                  child: Text(
                    islogin ? "Signup" : "Login",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signIn(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password,
    };
    var jsonResponse = null;

    var response =
        await http.post("http://192.168.0.108:8000/api/login", body: data);
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
            MaterialPageRoute(
                builder: (BuildContext context) => ReportedDisasterScreen()),
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
