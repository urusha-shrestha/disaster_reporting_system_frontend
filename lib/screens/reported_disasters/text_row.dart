import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  TextRow({@required this.labelText, @required this.dataText});
  final String labelText;
  final String dataText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
          SizedBox(width: 5),
          Flexible(
            child: Text(
              dataText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
