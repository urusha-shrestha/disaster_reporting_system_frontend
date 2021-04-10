import 'package:flutter/material.dart';
import '../../../constants.dart';

class DescriptionTextbox extends StatelessWidget {
  DescriptionTextbox({this.descriptionController});

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: descriptionController,
        maxLines: 15,
        decoration: InputDecoration(
          labelText: 'Description',
          alignLabelWithHint: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryColour),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
