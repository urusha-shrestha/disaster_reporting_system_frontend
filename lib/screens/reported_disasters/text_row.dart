import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  TextRow(
      {@required this.labelText,
      @required this.dataText,
      @required this.labelTextStyle,
      @required this.dataTextStyle});
  final String labelText;
  final String dataText;
  final labelTextStyle;
  final dataTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: labelTextStyle,
          ),
          Flexible(
            child: Text(
              dataText,
              style: dataTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
