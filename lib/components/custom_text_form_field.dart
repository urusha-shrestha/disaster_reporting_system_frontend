import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {this.validator,
      this.icon,
      @required this.label,
      this.suffixIcon,
      this.controller,
      this.keyboardType,
      this.hideText});
  final Function validator;
  final icon;
  final suffixIcon;
  final String label;
  final controller;
  final keyboardType;
  final bool hideText;
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        icon: widget.icon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.label,
        hintStyle: GoogleFonts.lato(fontSize: 16, color: Colors.grey[500]),
      ),
      obscureText: widget.hideText == null ? false : widget.hideText,
    );
  }
}
