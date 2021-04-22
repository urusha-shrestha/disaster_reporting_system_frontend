import 'package:flutter/material.dart';
import 'package:fyp/components/custom_text_form_field.dart';

class Location extends StatelessWidget {
  Location({@required this.locationController});
  final TextEditingController locationController;
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
        controller: locationController,
        label: 'Location',
        validator: (value) {
          if (value.isEmpty) {
            return "Please enter a location";
          }
        },
      )),
    );
  }
}
