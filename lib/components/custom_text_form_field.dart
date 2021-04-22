import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {this.validator,
      this.icon,
      @required this.label,
      this.suffixIcon,
      this.controller,
      this.keyboardType,
      this.hideText,
      this.initialValue,
      this.maxLines,
      @required this.border});
  final Function validator;
  final icon;
  final suffixIcon;
  final String label;
  final controller;
  final keyboardType;
  final bool hideText;
  final String initialValue;
  final maxLines;
  final bool border;
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines == null ? 1 : widget.maxLines,
      initialValue: widget.initialValue,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        icon: widget.icon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.label,
        hintStyle: GoogleFonts.lato(fontSize: 16, color: Colors.grey[500]),
        enabledBorder: widget.border
            ? const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: kprimaryColour),
              )
            : null,
        border: widget.border
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            : null,
      ),
      obscureText: widget.hideText == null ? false : widget.hideText,
    );
  }
}
