import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    borderSide: BorderSide(color: kdarkColour, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kdarkColour, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kgradientBackground = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [kprimaryColour, Colors.white],
  ),
);
