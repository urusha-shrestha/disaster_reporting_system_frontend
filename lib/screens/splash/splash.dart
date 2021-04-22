import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fyp/constants.dart';
import 'package:fyp/controllers/methods.dart';
import 'package:fyp/screens/logIn_and_signup/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    if (token != null) {
      print(token);
      getReport(context);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Body()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kgradientBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/images/icon2.png',
              ),
            ),
            Center(
                child: Text(
              'Emergencia',
              style: TextStyle(fontSize: 40.0),
            )),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: SpinKitFadingCircle(
                duration: Duration(seconds: 2),
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
