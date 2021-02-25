import 'package:flutter/material.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import 'package:fyp/constants.dart';

class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: kprimaryColour,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              label: 'Contact Number',
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter your contact number";
                }
                try {
                  int.parse(value);
                } catch (_) {
                  return "Please enter a correct contact number";
                }
              },
            ),
          )),
    );
  }
}
