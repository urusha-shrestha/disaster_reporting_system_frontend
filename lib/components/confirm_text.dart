import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class ConfirmText extends StatelessWidget {
  const ConfirmText({
    @required this.textValue,
  });

  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          textValue,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 20),
        ),
      ),
    );
  }
}
