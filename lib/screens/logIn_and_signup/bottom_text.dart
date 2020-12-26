import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Positioned buildBottomText({BuildContext context, islogin, onTap}) {
  return Positioned(
    bottom: MediaQuery.of(context).size.height * 0.07,
    left: MediaQuery.of(context).size.width * 0.43,
    child: GestureDetector(
      onTap: onTap,
      child: Text(
        islogin ? "Signup" : "Login",
        style: GoogleFonts.roboto(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
