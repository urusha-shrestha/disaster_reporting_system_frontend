import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class IconRow extends StatelessWidget {
  IconRow({
    @required this.icon,
    @required this.dataText,
    @required this.dataTextStyle,
    @required this.width,
  });
  final icon;
  final String dataText;
  final dataTextStyle;
  final bool width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: kprimaryColour,
          ),
          SizedBox(
            width: 3,
          ),
          Container(
            width: width ? 110 : null,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                dataText,
                style: dataTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
