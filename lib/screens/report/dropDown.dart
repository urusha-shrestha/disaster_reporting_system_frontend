import 'package:flutter/material.dart';
import 'package:fyp/constants.dart';
import 'file:///C:/Users/Urusha/AndroidStudioProjects/fyp/lib/demo_lists/demoDisasterList.dart';

class dropDown extends StatefulWidget {
  const dropDown({
    Key key,
  }) : super(key: key);

  @override
  _dropDownState createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  String dropDownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
          color: kprimaryColour,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
              isExpanded: true,
              hint: Text('Select disaster'),
              value: dropDownValue,
              items: disasters.map((disaster) {
                return DropdownMenuItem(
                  child: new Text(disaster),
                  value: disaster,
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropDownValue = newValue;
                });
              }),
        ),
      ),
    );
  }
}
