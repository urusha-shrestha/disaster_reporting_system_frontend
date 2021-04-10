import 'package:flutter/material.dart';

const kprimaryColour1 = Color(0xFFffcc93);
const kprimaryColour2 = Color(0xFFF5751D);
const kprimaryColour = Color(0xFFFEBF78);
const kbackgroundColour = Color(0xFFd0f5eb);
const kforegroundColour = Color(0xFFa5ecd7);
const kdarkColour = Color(0xFF41aea9);
const kappBarColour = Color(0xFf328581);
const ktextColour = Color(0xFF286966);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kprimaryColour, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kprimaryColour, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kgradientBackground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [kprimaryColour, kprimaryColour1, Colors.white],
  ),
);

const kgradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF78B7FE), Colors.white],
);

const klabelTextStyle = TextStyle(
  fontSize: 19.0,
  color: Colors.grey,
  letterSpacing: 1,
);

const kTextStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
    letterSpacing: 1,
    fontWeight: FontWeight.w500);
