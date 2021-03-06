import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:google_fonts/google_fonts.dart';

class topText extends StatelessWidget {
  const topText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome!",
            style: GoogleFonts.roboto(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: kprimaryColour,
            ),
          ),
        ],
      ),
    );
  }
}
