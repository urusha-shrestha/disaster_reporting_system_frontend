import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class CustomButton extends StatefulWidget {
  CustomButton({@required this.onPressed, @required this.buttonText});
  final Function onPressed;
  final String buttonText;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
          color: kprimaryColour,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 5, blurRadius: 12),
          ]),
      child: MaterialButton(
        onPressed: widget.onPressed,
        elevation: 2,
        child: Text(
          widget.buttonText,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
