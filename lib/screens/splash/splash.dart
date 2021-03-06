import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class Splash extends StatelessWidget {
  static const String id = 'splash_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kgradientBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Emergencia',
              style: TextStyle(fontSize: 40.0),
            )),
            SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(kprimaryColour),
            ),
          ],
        ),
      ),
    );
  }
}
