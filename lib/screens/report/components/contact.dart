import 'package:flutter/material.dart';
import 'package:fyp/components/custom_text_form_field.dart';

class Contact extends StatelessWidget {
  Contact({@required this.contactController});
  final TextEditingController contactController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kprimaryColour,
            ),
          ),*/
          child: CustomTextField(
        border: true,
        controller: contactController,
        label: 'Contact Number',
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter your contact number";
          }
          try {
            int.parse(value);
          } catch (_) {
            return "This field cannot contain alphabets.";
          }
          if (value.length == 10 || value.length == 7) {
            return null;
          } else {
            return "Must be of length either 7 or 10";
          }
        },
      )),
    );
  }
}
