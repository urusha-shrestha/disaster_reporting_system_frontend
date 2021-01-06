import 'package:flutter/material.dart';
import '../../constants.dart';

class description_textbox extends StatelessWidget {
  const description_textbox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 15,
        decoration: InputDecoration(
          labelText: 'Description',
          alignLabelWithHint: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryColour),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
