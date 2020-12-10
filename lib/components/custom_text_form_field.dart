import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {this.validator, this.icon, @required this.label, this.suffixIcon});
  final Function validator;
  final icon;
  final suffixIcon;
  final String label;
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      decoration: InputDecoration(
        icon: widget.icon,
        suffixIcon: widget.suffixIcon,
        labelText: widget.label,
        labelStyle: GoogleFonts.lato(fontSize: 16, color: Colors.grey[500]),
      ),
    );
  }
}
