import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  UserDetails({@required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
