import 'package:flutter/material.dart';
import 'package:fyp/components/loading.dart';
import 'package:fyp/screens/logIn_and_signup/log_In.dart';
import 'package:fyp/screens/logIn_and_signup/sign_up.dart';
import '../../constants.dart';
import 'bottom_text.dart';
import 'top_text.dart';

class Body extends StatefulWidget {
  static const String id = 'body';

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _logInFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();
  bool islogin = true;
  bool loginfail = false;
  bool _isHidden = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController registeremailController =
      new TextEditingController();
  final TextEditingController registerPasswordController =
      new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: mheight,
          width: mwidth,
          decoration: kgradientBackground,
          child: Stack(
            children: [
              Container(
                height: mheight,
                width: mwidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mheight * 0.01,
                    ),
                    TopText(),
                    Container(
                      height: mheight * 0.8,
                      width: mwidth * 0.95,
                      child: Stack(
                        children: [
                          LogIn(
                            formKey: _logInFormKey,
                            isLogin: islogin,
                            email: emailController,
                            password: passwordController,
                            isHidden: _isHidden,
                            passwordVisibility: _togglePasswordVisibility,
                          ),
                          islogin == false
                              ? SignUp(
                                  formKey: _registerFormKey,
                                  isLogin: islogin,
                                  name: nameController,
                                  email: registeremailController,
                                  password: registerPasswordController,
                                  confirmPassword: confirmPasswordController,
                                  isHidden: _isHidden,
                                  passwordVisibility: _togglePasswordVisibility,
                                  isLoading: isLoading,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              buildBottomText(
                  context: context,
                  islogin: islogin,
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
