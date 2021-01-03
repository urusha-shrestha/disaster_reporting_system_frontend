import 'package:flutter/material.dart';
import 'package:fyp/screens/logIn_and_signup/log_In.dart';
import 'package:fyp/screens/logIn_and_signup/sign_up.dart';
import '../../constants.dart';
import 'bottom_text.dart';
import 'top_text.dart';

class LogInScreen extends StatefulWidget {
  static const String id = 'logIn_page';

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool islogin = true;
  bool _isLoading = false;
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
                    topText(),
                    Container(
                      height: mheight * 0.8,
                      width: mwidth * 0.95,
                      child: Stack(
                        children: [
                          Log_In(
                            formKey: _formKey,
                            isLogin: islogin,
                            email: emailController,
                            password: passwordController,
                            isHidden: _isHidden,
                            passwordVisibility: _togglePasswordVisibility,
                            isLoading: _isLoading,
                          ),
                          islogin == false
                              ? Sign_Up(
                                  isLogin: islogin,
                                  name: nameController,
                                  email: registeremailController,
                                  password: registerPasswordController,
                                  confirmPassword: confirmPasswordController,
                                  isHidden: _isHidden,
                                  passwordVisibility: _togglePasswordVisibility,
                                  isLoading: _isLoading,
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
