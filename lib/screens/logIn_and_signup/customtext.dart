import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingText extends StatelessWidget {
  HeadingText({this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 20, right: 30),
            child: Text(
              label,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  color: Colors.grey[400]),
            ),
          ),
        ],
      ),
    );
  }
}
