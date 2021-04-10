import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

bool isLoading = false;

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SpinKitFadingCircle(
          duration: Duration(seconds: 2),
          color: Colors.red,
        ),
      ),
    );
  }
}
