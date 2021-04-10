import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';

class IconRow extends StatelessWidget {
  IconRow({
    @required this.icon,
    @required this.dataText,
    @required this.dataTextStyle,
  });
  final icon;
  final String dataText;
  final dataTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: kprimaryColour,
          ),
          SizedBox(width: 4),
          Text(
            dataText,
            style: dataTextStyle,
          ),
        ],
      ),
    );
  }
}
