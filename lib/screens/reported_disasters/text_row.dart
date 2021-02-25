import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  TextRow({@required this.labelText, @required this.dataText});
  final String labelText;
  final String dataText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 18.0, color: Colors.grey.shade800),
        ),
        Flexible(
          child: Text(
            dataText,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
