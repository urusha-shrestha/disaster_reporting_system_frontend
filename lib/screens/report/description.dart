import 'package:flutter/material.dart';
import '../../constants.dart';

class description_textbox extends StatelessWidget {
  description_textbox({this.descriptionController});

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: descriptionController,
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
