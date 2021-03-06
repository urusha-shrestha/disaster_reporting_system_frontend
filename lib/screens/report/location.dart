import 'package:flutter/material.dart';
import 'package:fyp/components/custom_text_form_field.dart';
import '../../constants.dart';

class location extends StatelessWidget {
  location({@required this.locationController});
  final TextEditingController locationController;
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
              controller: locationController,
              label: 'Location',
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter a location";
                }
              },
            ),
          )),
    );
  }
}
