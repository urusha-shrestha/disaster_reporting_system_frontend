import 'package:flutter/material.dart';

class RegisterText extends StatelessWidget {
  RegisterText({@required this.onPressed});
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Material(
        child: MaterialButton(
          height: 50.0,
          color: Color(0xFFa5ecd7),
          onPressed: onPressed,
          child: Text(
            'Register',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
